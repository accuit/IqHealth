
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';


@Injectable()
export class AppJsonService {
    constructor(private http: HttpClient) {
    }

    services: any = [
        {
            "ID": 1,
            "Name": "Pathalogy",
            "Description": "Leela HealthCare basically aims at improving life’s of others. In terms of pathology, it is a medical specialty that determines the cause and nature of diseases by examining and testing body tissues (from biopsies and pap smears, for example) and bodily fluids (from samples including blood and urine). The results from these pathology tests help Doctors diagnose and treat patients correctly. Basically, an integral part of clinical diagnosis",
            "ImageUrl": "../../assets/img/services images/pathology .jpg",
            "PageUrl": "page3 url (if any)",
            "CreatedDate": "2016-03-22T09:27:52",
            "UpdatedDate": "2019-08-03T12:17:18",
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": "Biochemistry,Clinical Pathology,Cytopathology,Haematology, Immunology, Molecular Biology, Molecular Genetics, Serology",
            "ServicesInclList": [
                "Biochemistry",
                "Clinical Pathology",
                "Cytopathology",
                "Haematology",
                "Immunology",
                "Molecular Biology",
                "Molecular Genetics",
                "Serology"
            ]
        },
        {
            "ID": 2,
            "Name": "Cardiology",
            "Description": "Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart. It deals with the diagnosis and treatment of such conditions as congenital heart defects, coronary artery disease, electrophysiology, heart failure and heart disease. Subspecialties of the cardiology field include cardiac electrophysiology, echocardiography, interventional cardiology and nuclear cardiology",
            "ImageUrl": "../../assets/img/services images/cardiology.jpg",
            "PageUrl": "page3 url (if any)",
            "CreatedDate": "2019-07-29T09:27:52",
            "UpdatedDate": "2019-08-03T12:16:24",
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": "ECG, Holter monitoring, BP monitoring",
            "ServicesInclList": [
                "ECG",
                "Holter monitoring",
                "BP monitoring"
            ]
        },
        {
            "ID": 3,
            "Name": "Spirometry",
            "Description": "Spirometry (spy-ROM-uh-tree) is a common office test used to assess how well your lungs work by measuring how much air you inhale, how much you exhale and how quickly you exhale.Spirometry is used to diagnose asthma, chronic obstructive pulmonary disease (COPD) and other conditions that affect breathing. Spirometry may also be used periodically to monitor your lung condition and check whether a treatment for a chronic lung condition is helping you breathe better.",
            "ImageUrl": "../../assets/img/services images/spirometry.jpg",
            "PageUrl": "page3 url (if any)",
            "CreatedDate": "2019-07-29T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": null,
            "ServicesInclList": [

            ]
        },
        {
            "ID": 4,
            "Name": "Neurology",
            "Description": "Neurology is a branch of medicine dealing with disorders of the nervous system. Neurology deals with the diagnosis and treatment of all categories of conditions and disease involving the central and peripheral nervous systems, including their coverings, blood vessels, and all effector tissue, such as muscle.",
            "ImageUrl": "../../assets/img/services images/Neurology.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": "NCV Study,  EMG Study , EEG ,BLINK REFLEX    ,VEP Study ,BAER Study  ,SSEP Study  ",
            "ServicesInclList": [
                "NCV Study",
                "EMG Study",
                "EEG",
                "BLINK REFLEX",
                "VEP Study",
                "BAER Study",
                "SSEP Study"
            ]
        },
        {
            "ID": 5,
            "Name": "GynaCare",
            "Description": "Gynaecare clinic offers a comprehensive range of treatments with complete scientific solutions for infertility and sexual dysfunctions. Our dedicated team of doctors personally interact with the patients , answer their queries and decide on the treatment accordingly. We offer the best services in fertility and reproductive medicine. Some of the services offered at our clinic are:",
            "ImageUrl": "../../assets/img/services images/gynae-clinic.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": "Pre & post-natal check up,Laproscopic surgeries, Hysterectomy,Measures for Family Planning, Abnormal bleeding problems, Treatment for Hormonal Imbalance, Blood Tests, IVF or In Vitro Fertilization, Infertility work up, IUI or Intrauterine Insemination,\r Safe medical termination of pregnancy (abortion).\r",
            "ServicesInclList": [
                "Pre & post-natal check up",
                "Laproscopic surgeries",
                "Hysterectomy",
                "Measures for Family Planning",
                "Abnormal bleeding problems",
                "Treatment for Hormonal Imbalance",
                "Blood Tests",
                "IVF or In Vitro Fertilization",
                "Infertility work up",
                "IUI or Intrauterine Insemination",
                "\r Safe medical termination of pregnancy (abortion).\r"
            ]
        },
        {
            "ID": 6,
            "Name": "Child Care Clinic",
            "Description": "Childcare clinic offers a comprehensive range of treatments with complete solutions for Child. Our experienced team of Paediatricians caters to the Medical Needs of Newborns, Toddlers, Teenagers and Adolescents., answer their queries and decide on the treatment accordingly. We offer the best services in Paedtrics. Some of the services offered at our clinic are",
            "ImageUrl": "../../assets/img/services images/child-care-clinic.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": "Neonatology\r,Paedtric Intensivist",
            "ServicesInclList": [
                "Neonatology\r",
                "Paedtric Intensivist"
            ]
        },
        {
            "ID": 7,
            "Name": "Diabetes Care Clinic",
            "Description": "Diabetes is a hassle-some disease. At Leela HealthCare, we take the stress out of diabetes. We provide everything a diabetic might need, under one roof. Right from diagnosis to speaking to a dietician, educator, diabetologist. As a patient, you don’t have to keep going from pillar to post. We help patients manage Type 1, 2, gestational or prediabetes. Our evaluations, physical exams and treatments are geared to detect and prevent complications brought on by the disease. Our medical team can help you create routines for nutrition and exercise to prevent diabetes if you are prediabetes. For some type 2 patients, we may be able to control diabetes without medication through weight loss, diet and exercise. Our goal is to provide the best possible solution for your particular diagnosis. There are many ways to treat diabetes. Our doctors gives you options and works with you to design a plan that fits your lifestyle so you can successfully live with diabetes. Along with diet, exercise, oral medications, insulin and non-insulin injections, we also have expertise in insulin pump and continuous glucose monitoring.",
            "ImageUrl": "../../assets/img/services images/diabetes-.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": null,
            "ServicesInclList": [

            ]
        },
        {
            "ID": 8,
            "Name": "Endrocrinology",
            "Description": "The department of endocrinology at Leela HealthCare offers the best treatment modalities available for endocrine disorders to provide accurate and comprehensive care for its patients suffering from various endocrine diseases.\r",
            "ImageUrl": "../../assets/img/services images/endrocrinology.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": null,
            "ServicesInclList": [

            ]
        },
        {
            "ID": 9,
            "Name": "Ortho Clinic",
            "Description": "The department of orthopaedic at Leela HealthCare offers the best treatment modalities available for ortho ailments to provide accurate and comprehensive care for its patients suffering from various ortho problems. In addition, efficient occupational therapists, physiotherapists and pain management experts work towards the quick rehabilitation of the patient leading to a better quality of life",
            "ImageUrl": "../../assets/img/services images/ortho-clinic.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": null,
            "ServicesInclList": [

            ]
        },
        {
            "ID": 10,
            "Name": "Physiotherapy",
            "Description": "Physiotherapy is a health science that aims in rehabilitation and enhance individuals with movement chaos by utilizing evidence-based, natural process like motivation, exercise, education, advocacy and adapted tools. Physiotherapists study subjects like neuroscience,physiology and anatomy for developing attitudes and skills that are very much required for health prevention, education, rehabilitation and treatment of the patients with disabilities and physical ailments.It is sad to say that there are still many educated people in India who think that physiotherapy is only related to a few exercises. Physiotherapy is a science in itself. One might be suffering from cardiopulmonary ,orthopaedic, paediatric, neurology, sports injury, congenital abnormality, to name a few, where physical management becomes as a essential part of the rehabilitation process and some times is the only process. Why physiotherapy at Leela HealthCare? At Leela HealthCare our clinic run by experienced team of doctors and paramedics.  We have all type modern Electrotherapy equipments,exercise Theraphy,Manual Theraphy,here patient can get Acupuncture Treatment facility also apart with these. We basically try to alleviate the pain through various modern techniques or tools that can be used by the experience team of doctors and paramedics.\r \"",
            "ImageUrl": "../../assets/img/services images/physiotherapy.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": null,
            "ServicesInclList": [

            ]
        },
        {
            "ID": 11,
            "Name": "Pain Clinic",
            "Description": "We provide pain management services for diagnosis and treatment for painful conditions.We treat back pain, knee pain, headache, neck pain and cancer pain etc.... due to slipped disc, migraine, Cluster Headache﻿, trigeminal neuralgia, arthritis, spondylitis, cancer etc. We use most advanced interventional pain management methods...like radio-frequency ablation, spinal cord stimulation, Percutaneous Discectomy, vertebroplasty, Epidural steroid injections, Epiduroscopy, Ozone Necleolysis, Platelet Rich Plasma (PRP)﻿ Therapy etc.",
            "ImageUrl": "../../assets/img/services images/pain-clinic.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": "IFT,Laser Therapy,Tens,Acupuncture/Dry Needling,Electro acupuncture,Ultrasonic therapy,Diapulse /SWD,Electro stimulators,Neuromuscular stimulations,Electronic tractions,Manual Therapy/Manupulataion,Taping Techniques\r \"",
            "ServicesInclList": [
                "IFT",
                "Laser Therapy",
                "Tens",
                "Acupuncture/Dry Needling",
                "Electro acupuncture",
                "Ultrasonic therapy",
                "Diapulse /SWD",
                "Electro stimulators",
                "Neuromuscular stimulations",
                "Electronic tractions",
                "Manual Therapy/Manupulataion",
                "Taping Techniques\r \""
            ]
        },
        {
            "ID": 12,
            "Name": "Sports Medicine",
            "Description": "Sports Medicine is an integral part of modern medicine. Sports Medicine practitioners deal with human fitness and conditioning related to performance, different types of injuries including sports injuries, rehabilitation, pain and weaknesses arising out of different kinds of injuries and diseases The GOAL of Sports Medicine is to prevent injuries, to improve bodily functions and movements and to treat pain in the shortest possible time and with minimum use of medicines. Sports Medicine Therapy requires specific infrastructure including modern Physiotherapy and modern gadgets and also a team of qualified and dedicated experts from different branches of sports sciences.  ood nutrition is an important part of leading a healthy lifestyle. Health issues such as diabetes, hypertension or atherosclerosis could be a result of poor nutrition. The Nutrition and Dietetics Centre at Apollo  Clinic strives to establish and encourage nutritional standards and practices as an integral part of the health care service provided.",
            "ImageUrl": "../../assets/img/services images/Sports-Medicine.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": null,
            "ServicesInclList": [

            ]
        },
        {
            "ID": 13,
            "Name": "Nutrition / Dietician",
            "Description": "Dietetics is about healthy eating practices which act as a preventive and curative means and pave the foundation for a healthier life. At Leela HealthCare, we regularly counsel our patients about a nutritious, balanced diet that consists of carbohydrates, fats, proteins, minerals, vitamins and electrolytes for their general well-being. Good nutrition is essential for normal organ development and function, normal reproduction, growth and maintenance of muscles and tissue, optimum activity and working efficiency, building resistance to infection and in repairing body damage or injury. The Nutrition and Dietetics team at Leela HealthCare aims to improve the clinical, biochemical, cellular and psychological status of individuals experiencing complications or side effects of various treatments by providing adequate nutrition and related information.",
            "ImageUrl": "../../assets/img/services images/nutrition-dietician.jpg",
            "PageUrl": null,
            "CreatedDate": "2019-08-08T09:27:52",
            "UpdatedDate": null,
            "IsDeleted": 0,
            "Type": 0,
            "ServicesIncluded": null,
            "ServicesInclList": [

            ]
        }
    ];

    states: IndianState[] = [
        // { "id": 1, "code": "AN", "name": "Andaman and Nicobar Islands" },
        // { "id": 2, "code": "AP", "name": "Andhra Pradesh" },
        // { "id": 3, "code": "AR", "name": "Arunachal Pradesh" },
        // { "id": 4, "code": "AS", "name": "Assam" },
        // { "id": 5, "code": "BR", "name": "Bihar" },
        // { "id": 6, "code": "CG", "name": "Chandigarh" },
        // { "id": 7, "code": "CH", "name": "Chhattisgarh" },
        // { "id": 8, "code": "DH", "name": "Dadra and Nagar Haveli" },
        // { "id": 9, "code": "DD", "name": "Daman and Diu" },
        // { "id": 10, "code": "DL", "name": "Delhi" },
        // { "id": 11, "code": "GA", "name": "Goa" },
        // { "id": 12, "code": "GJ", "name": "Gujarat" },
        // { "id": 13, "code": "HR", "name": "Haryana" },
        // { "id": 14, "code": "HP", "name": "Himachal Pradesh" },
        // { "id": 15, "code": "JK", "name": "Jammu and Kashmir" },
        // { "id": 16, "code": "JH", "name": "Jharkhand" },
        // { "id": 17, "code": "KA", "name": "Karnataka" },
        // { "id": 18, "code": "KL", "name": "Kerala" },
        // { "id": 19, "code": "LD", "name": "Lakshadweep" },
        { "id": 20, "code": "MP", "name": "Madhya Pradesh" },
        { "id": 21, "code": "MH", "name": "Maharashtra" },
        // { "id": 22, "code": "MN", "name": "Manipur" },
        // { "id": 23, "code": "ML", "name": "Meghalaya" },
        // { "id": 24, "code": "MZ", "name": "Mizoram" },
        // { "id": 25, "code": "NL", "name": "Nagaland" },
        // { "id": 26, "code": "OR", "name": "Odisha" },
        // { "id": 27, "code": "PY", "name": "Puducherry" },
        { "id": 28, "code": "PB", "name": "Punjab" },
        { "id": 29, "code": "RJ", "name": "Rajasthan" },
        // { "id": 30, "code": "SK", "name": "Sikkim" },
        // { "id": 31, "code": "TN", "name": "Tamil Nadu" },
        // { "id": 32, "code": "TS", "name": "Telangana" },
        // { "id": 33, "code": "TR", "name": "Tripura" },
        { "id": 34, "code": "UK", "name": "Uttarakhand" },
        { "id": 35, "code": "UP", "name": "Uttar Pradesh" },
        { "id": 36, "code": "WB", "name": "West Bengal" }]



    public getTimings(): any {
        const appointmentTimings = [
            "09:00 AM - 10:00 AM",
            "10:00 AM - 11:00 AM",
            "11:00 AM - 12:00 PM",
            "12:00 AM - 01:00 PM",
            "01:00 PM - 02:00 PM",
            "02:00 PM - 03:00 PM",
            "03:00 PM - 04:00 PM",
            "04:00 PM - 05:00 PM",
            "05:00 PM - 06:00 PM",
        ]
        return appointmentTimings;
    }

    public getAllServices(): any {
        return this.services;
    }


    public getAllIndianStates(): IndianState[] {
        return this.states;
    }
}

export class IndianState {
    id: number;
    code: string;
    name: string
}
