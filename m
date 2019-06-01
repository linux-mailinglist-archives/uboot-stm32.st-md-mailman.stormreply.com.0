Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F69D31B86
	for <lists+uboot-stm32@lfdr.de>; Sat,  1 Jun 2019 12:58:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFE6BC0C1D3
	for <lists+uboot-stm32@lfdr.de>; Sat,  1 Jun 2019 10:58:42 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4750AC0C1D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Jun 2019 10:58:41 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
 by mx0b-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x51AvSxn012276
 for <uboot-stm32@st-md-mailman.stormreply.com>; Sat, 1 Jun 2019 05:58:39 -0500
Received: from nam01-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam01lp2051.outbound.protection.outlook.com [104.47.33.51])
 by mx0b-00010702.pphosted.com with ESMTP id 2supaxr5jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Sat, 01 Jun 2019 05:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector1-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/UKTzQsSuVsZRL6xDKBKIE8+AFN1Xo+s7NZZ6NFPh0=;
 b=itpfSwqAIZ12i9GGiDGr3Ji5Dj43tm5rNpbdU+ztNhHjYq9GnMGm4/nhxwm4iNQg7LZ0uMr1SUFC/TBILuAedRfPBfOu1QuMYzjA+dSnE4bPk4NReAsU8OB/MUgmM0Db0xtz9fvR5+YjeYNzYlTtoxbeAsG14JIniBZtEPeabHA=
Received: from DM5PR04MB0381.namprd04.prod.outlook.com (10.173.169.144) by
 DM5PR04MB0731.namprd04.prod.outlook.com (10.172.187.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Sat, 1 Jun 2019 10:58:37 +0000
Received: from DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::6027:7159:e486:5646]) by DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::6027:7159:e486:5646%5]) with mapi id 15.20.1922.024; Sat, 1 Jun 2019
 10:58:37 +0000
From: Joe Hershberger <joe.hershberger@ni.com>
To: Christophe Roullier <christophe.roullier@st.com>
Thread-Topic: [U-Boot] [PATCH v2 3/6] net: dwc_eth_qos: add Ethernet stm32mp1
 support
Thread-Index: AQHVGGj2kTvTLAFvjUSzbLvilFMRHg==
Date: Sat, 1 Jun 2019 10:58:37 +0000
Message-ID: <CANr=Z=ZxSTuG+5rh-NydRjVG9KpSx3hO+b3EbqTKL1+N7KJJPA@mail.gmail.com>
References: <20190517130847.13144-1-christophe.roullier@st.com>
 <20190517130847.13144-4-christophe.roullier@st.com>
In-Reply-To: <20190517130847.13144-4-christophe.roullier@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:207:3c::18) To DM5PR04MB0381.namprd04.prod.outlook.com
 (2603:10b6:3:9e::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAX+PtOS7lp9dHWs99e7g3CnKaB3zlZ6J4W4qpk8kE9W7OY8Vv7S
 WeL9B12pi7Fgm+7XSvW9jQ2fsELdzpupltmQn6s=
x-google-smtp-source: APXvYqxn1GhOsuSEic4mh8B+Q/q4n/AXsf271LQT0MvGyMiajnWDPNQoP2iw/jr11/y6mAmb6o1AXl01BmlYmtDn6Ag=
x-received: by 2002:a6b:bbc1:: with SMTP id
 l184mr10023208iof.232.1559386715265; Sat, 01 Jun 2019 03:58:35 -0700 (PDT)
x-gmail-original-message-id: <CANr=Z=ZxSTuG+5rh-NydRjVG9KpSx3hO+b3EbqTKL1+N7KJJPA@mail.gmail.com>
x-originating-ip: [209.85.166.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 192ae7eb-503d-4397-4602-08d6e68018fc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR04MB0731; 
x-ms-traffictypediagnostic: DM5PR04MB0731:
x-microsoft-antispam-prvs: <DM5PR04MB0731E9AE2E73FD7717AEF64BF61A0@DM5PR04MB0731.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 00550ABE1F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(376002)(396003)(39850400004)(366004)(189003)(199004)(386003)(6512007)(61266001)(9686003)(256004)(26005)(186003)(316002)(6506007)(53546011)(52116002)(55446002)(76176011)(229853002)(6436002)(6862004)(498394004)(2906002)(6486002)(61726006)(7736002)(4744005)(6116002)(3846002)(5660300002)(305945005)(6246003)(66066001)(53936002)(25786009)(66946007)(73956011)(68736007)(446003)(8936002)(476003)(486006)(4326008)(11346002)(54906003)(8676002)(71190400001)(99286004)(478600001)(102836004)(64756008)(66556008)(66446008)(81166006)(81156014)(66476007)(71200400001)(14454004)(43066004)(95326003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0731;
 H:DM5PR04MB0381.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m0j0leV+A+rx3jvXtgNlIlYMDc6Zhtm9zz3n86Q1Na+SKn9tCaVPKHmdsl5+MwO5xv/lF+D04RY129uBTfI4EX5qxvpEa+vD9YXYx0sYSAFtHGRoDaaZ6n6ClqFQwIxoLqIzACK9zOMh68ifF7seyySUJiatQFohk4X+BCWcqFmntTefGKrcyFM+Y+n1mfLpry7QQfLE7U99T2Y2AzIowuj6LSh4JcdUa/VzDUfckjtyolnn0/Df6qJGB47fsdT9v2XdiJM2gJs4vud9gHIVRptnzzNyjVCxgdukMd3NUd7K17699/JMzP7WD/TM4ADvyVd1h1U5ACwcmWN0VJ/7TXepkTW8mZKfqoeD580zoxqTSJfH/bKiRpyBHBU/qx8EuZ0kpRaWAOlFFKS1ed8d1xmVx52VmaYLTX7aoi2VEKI=
Content-ID: <BCC06BC06622934A833018C227B446AF@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192ae7eb-503d-4397-4602-08d6e68018fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2019 10:58:37.3846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joseph.hershberger@ni.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0731
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-01_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906010081
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot <u-boot@lists.denx.de>, Joseph Hershberger <joseph.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 3/6] net: dwc_eth_qos: add
 Ethernet stm32mp1 support
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Reply-To: joe.hershberger@ni.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, May 17, 2019 at 8:17 AM Christophe Roullier
<christophe.roullier@st.com> wrote:
>
> Synopsys GMAC 4.20 is used. And Phy mode for eval and disco is RMII
> with PHY Realtek RTL8211 (RGMII)
> We also support some other PHY config on stm32mp157c
> PHY_MODE        (MII,GMII, RMII, RGMII) and in normal,
> PHY wo crystal (25Mhz and 50Mhz), No 125Mhz from PHY config
>
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>

Acked-by: Joe Hershberger <joe.hershberger@ni.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
