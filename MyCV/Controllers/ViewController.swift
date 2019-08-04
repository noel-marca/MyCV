//
//  ViewController.swift
//  MyCV
//
//  Created by MIguel Martinez on 8/2/19.
//  Copyright © 2019 Noel MIguel Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: IBOutlet
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblSeccion: UILabel!
    @IBOutlet weak var lblPersona: UILabel!
    @IBOutlet weak var lblAcademicos: UILabel!
    @IBOutlet weak var lblCertificaciones: UILabel!
    @IBOutlet weak var lblHabilidades: UILabel!
    @IBOutlet weak var lblExperiencia: UILabel!
    
    @IBOutlet weak var tblInformacion: UITableView!
    
    @IBOutlet weak var viewPersona: UIView!
    @IBOutlet weak var viewAcademicos: UIView!
    @IBOutlet weak var viewCertificaciones: UIView!
    @IBOutlet weak var viewHabilidades: UIView!
    @IBOutlet weak var viewExperiencia: UIView!
    
    @IBOutlet weak var imgPersona: UIImageView!
    @IBOutlet weak var imgAcademicos: UIImageView!
    @IBOutlet weak var imgCertificaciones: UIImageView!
    @IBOutlet weak var imgHabilidades: UIImageView!
    @IBOutlet weak var imgExperiencia: UIImageView!
    
    //MARK: Variables
    
    var spinner: UIView = UIView()
    var datosLista: NSArray = NSArray()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblInformacion.backgroundColor = UIColor.clear
        tblInformacion.rowHeight = UITableView.automaticDimension
        tblInformacion.estimatedRowHeight = 600
        configuraBotones()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        getPersonalInformation()
    }
    
    func configuraBotones() {
        let repoTapGesture = UITapGestureRecognizer(target: self, action: #selector(getPersonalInformation))
        viewPersona.addGestureRecognizer(repoTapGesture)
        viewPersona.isUserInteractionEnabled = true
        let movTapGesture = UITapGestureRecognizer(target: self, action: #selector(getAcademicDataInformation))
        viewAcademicos.addGestureRecognizer(movTapGesture)
        viewAcademicos.isUserInteractionEnabled = true
        let salTapGesture = UITapGestureRecognizer(target: self, action: #selector(getCertificationsInformation))
        viewCertificaciones.addGestureRecognizer(salTapGesture)
        viewCertificaciones.isUserInteractionEnabled = true
        let patTapGesture = UITapGestureRecognizer(target: self, action: #selector(getInformationSkills))
        viewHabilidades.addGestureRecognizer(patTapGesture)
        viewHabilidades.isUserInteractionEnabled = true
        let ctaTapGesture = UITapGestureRecognizer(target: self, action: #selector(getWorkExperienceInformation))
        viewExperiencia.addGestureRecognizer(ctaTapGesture)
        viewExperiencia.isUserInteractionEnabled = true
    }
    
    //MARK: Navigation
    
    @objc func getPersonalInformation() {
        showSpinner()
        lblSeccion.text = "INFORMACIÓN PERSONAL"
        botonesEnGris()
        datosLista = ViewControllerUtils().getdatos(tag: .PersonalInformation)
        tblInformacion.reloadData()
        tblInformacion.scrollToRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, at: .top, animated: true)
        lblPersona.textColor = ViewControllerUtils().UIColorFromHex(hexString: "0C494F", alpha: 1.0)
        animarImagenen(imagen: imgPersona)
        hideSpinner()
    }
    
    @objc func getAcademicDataInformation () {
        showSpinner()
        lblSeccion.text = "DATOS ACADÉMICOS"
        botonesEnGris()
        datosLista = ViewControllerUtils().getdatos(tag: .AcademicDataInformation)
        tblInformacion.reloadData()
        tblInformacion.scrollToRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, at: .top, animated: true)
        lblAcademicos.textColor = ViewControllerUtils().UIColorFromHex(hexString: "0C494F", alpha: 1.0)
        animarImagenen(imagen: imgAcademicos)
        hideSpinner()
    }
    
    @objc func getCertificationsInformation() {
        showSpinner()
        lblSeccion.text = "CERTIFICACIONES / CURSOS"
        botonesEnGris()
        datosLista = ViewControllerUtils().getdatos(tag: .CertificationsInformation)
        tblInformacion.reloadData()
        tblInformacion.scrollToRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, at: .top, animated: true)
        lblCertificaciones.textColor = ViewControllerUtils().UIColorFromHex(hexString: "0C494F", alpha: 1.0)
        animarImagenen(imagen: imgCertificaciones)
        hideSpinner()
    }
    
    @objc func getInformationSkills() {
        showSpinner()
        lblSeccion.text = "RESUMEN PROFESIONAL"
        botonesEnGris()
        datosLista = ViewControllerUtils().getdatos(tag: .InformationSkills)
        tblInformacion.reloadData()
        tblInformacion.scrollToRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, at: .top, animated: true)
        lblHabilidades.textColor = ViewControllerUtils().UIColorFromHex(hexString: "0C494F", alpha: 1.0)
        animarImagenen(imagen: imgHabilidades)
        hideSpinner()
    }
    
    @objc func getWorkExperienceInformation() {
        showSpinner()
        lblSeccion.text = "EXPERIENCIA LABORAL"
        botonesEnGris()
        datosLista = ViewControllerUtils().getdatos(tag: .WorkExperienceInformation)
        tblInformacion.reloadData()
        tblInformacion.scrollToRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, at: .top, animated: true)
        lblExperiencia.textColor = ViewControllerUtils().UIColorFromHex(hexString: "0C494F", alpha: 1.0)
        animarImagenen(imagen: imgExperiencia)
        hideSpinner()
    }
    
    // MARK: UITableViewDelegate UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datosLista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Datos", for: indexPath) as! DatosTableViewCell
        let dict = datosLista[indexPath.row] as! NSDictionary
        cell.lblIdeintificador.text = dict.object(forKey: "identificador") as? String
        cell.lblValor.text = dict.object(forKey: "valor") as? String
        return cell
    }
    
    //MARK: Utilerias
    
    func showSpinner() {
        spinner = ViewControllerUtils().showActivityIndicator(uiView: self.view, color: ViewControllerUtils().UIColorFromHex(hexString: "4B8388", alpha: 1.0))
        self.view.addSubview(spinner)
    }
    
    func hideSpinner() {
        ViewControllerUtils().stopActivityIndicator()
        spinner.removeFromSuperview()
    }
    
    func botonesEnGris() {
        lblPersona.textColor = ViewControllerUtils().UIColorFromHex(hexString: "5D6273", alpha: 1.0)
        lblAcademicos.textColor = ViewControllerUtils().UIColorFromHex(hexString: "5D6273", alpha: 1.0)
        lblCertificaciones.textColor = ViewControllerUtils().UIColorFromHex(hexString: "5D6273", alpha: 1.0)
        lblHabilidades.textColor = ViewControllerUtils().UIColorFromHex(hexString: "5D6273", alpha: 1.0)
        lblExperiencia.textColor = ViewControllerUtils().UIColorFromHex(hexString: "5D6273", alpha: 1.0)
    }
    
    func animarImagenen(imagen: UIImageView) {
        UIView.animate(withDuration: 0.30, animations: {() -> Void in
            imagen.transform = CGAffineTransform(scaleX: 1.65, y: 1.65)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 0.30, animations: {() -> Void in
                imagen.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
    }
}
