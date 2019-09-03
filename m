Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79338A7690
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Sep 2019 23:53:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10EEFC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Sep 2019 21:53:47 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8575C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2019 21:53:44 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
 by mx0b-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x83LoZ5e010541
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 3 Sep 2019 16:53:43 -0500
Received: from nam05-by2-obe.outbound.protection.outlook.com
 (mail-by2nam05lp2056.outbound.protection.outlook.com [104.47.50.56])
 by mx0b-00010702.pphosted.com with ESMTP id 2uqnv01qqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 03 Sep 2019 16:53:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0z96AKaD6K8bF8Ubi/cMA6D5V0dZJ42Q4Uwu2ueycinLWijuyhLDcdRURLivKL81BlTOZzqJhFMgGPQKTQQxCDhck87/8ZDqKblG6szszgFfoibIU3IzCRLKGh1/yqGq+X7p6Bkhqy16CV58ZE0qNZb6HkQMQKvX/3VIHZrtdm+TUhvvWq4eZIYAK9WYRV5HHZmrG+8N3rmxoqJKM94oRxJ6M5a2W8vgwutFjTfkPtNHvnMWcVgfnSesDb5V4UjY67ylh4sWYo4squCmN2omAgFby6DHQHTj5g+EkpsRPNNiVLYVwD/27jnW2hCbfzKoLW39l9gOzssotYc6YmhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5LM+LkJ2yNmkNRfhHf+MaCW1xT6nPX/n+JU+HX0OsE=;
 b=MOWZ90IE0LYYId8X0xcUHuyxpbvRp455F/tkwxzrig5s1ng0pzik63fooVuq63oNKO3JV7Q3GhZ287UkTnpXlBQ+Al9RdwuxWcSkpTcsK/ze7GrtKFCAItd1JzFvE+9BOrPcHtzMmR20PzgaCT8Zp05zB/zdxBcxd/bfVI8MuyLJZPfowq1MAIxeDl7t4q4ZKp4WoNrNiOHyJ/nhi5vAq7ibSX9mz4rb5F3rpo8EUrnuL3lQQLM/zCbr4rF7yZf/b6oHrwFpvLRMyImVaMfLZpI6RFDdbQkiV3gha2Xl2rlwuVPJ/8q5h6/KUfAotk0NM1MEXQLKYGP2D0iF76v8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5LM+LkJ2yNmkNRfhHf+MaCW1xT6nPX/n+JU+HX0OsE=;
 b=PJRTNeofi13z1k708DxuKoGC23LKAkTPumiK+g6TOfXYeRg49g9pDy3bPYhgjPdV3T8g5rXATbVYzjqrc0UoHeDh2uOnQaGGh4PlQbx4PtATCPRfQcHEvtxtMZbkgnyinnyyCyKeVqNb6elU4ya8HineYMukEYZApyS7v/EhcfI=
Received: from DM5PR04MB0381.namprd04.prod.outlook.com (10.173.169.144) by
 DM5PR04MB1259.namprd04.prod.outlook.com (10.174.190.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Tue, 3 Sep 2019 21:53:41 +0000
Received: from DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::31fd:3e95:1521:18a2]) by DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::31fd:3e95:1521:18a2%7]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 21:53:41 +0000
From: Joe Hershberger <joe.hershberger@ni.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Thread-Topic: [U-Boot] [PATCH 2/2] net: dwc_et_qos: update weak function
 board_interface_eth_init
Thread-Index: AQHVYqIMBhE+Udy9zUGIlCqq+5Bdfw==
Date: Tue, 3 Sep 2019 21:53:40 +0000
Message-ID: <CANr=Z=b1XMfMYTgqzdWz9QNAJZ+R6GOUovTb63otXq36SF2ZTw@mail.gmail.com>
References: <1564651743-28430-1-git-send-email-patrick.delaunay@st.com>
 <1564651743-28430-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564651743-28430-2-git-send-email-patrick.delaunay@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0129.eurprd05.prod.outlook.com
 (2603:10a6:207:2::31) To DM5PR04MB0381.namprd04.prod.outlook.com
 (2603:10b6:3:9e::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAVtaMCuGw7XHLdxD7EuIDZkTi0PpiFqIGkgPt15YaM2loVU+JaD
 3SapTYnCKrdmrj8WS+QJel+u5sX5rxa93ZtfKWE=
x-google-smtp-source: APXvYqxgAbmgyKpjln8vIVJ2FfvLOvFkQI+HJdS2xd6nI9OF3Wbmjf871tiSENaP/QeWWYbyqCvYtNPRpk3zOjHVozM=
x-received: by 2002:a1c:a8cb:: with SMTP id
 r194mr1625878wme.156.1567547615658; Tue, 03 Sep 2019 14:53:35 -0700 (PDT)
x-gmail-original-message-id: <CANr=Z=b1XMfMYTgqzdWz9QNAJZ+R6GOUovTb63otXq36SF2ZTw@mail.gmail.com>
x-originating-ip: [209.85.128.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 498ec598-fac9-4d06-fc6d-08d730b92e63
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR04MB1259; 
x-ms-traffictypediagnostic: DM5PR04MB1259:
x-microsoft-antispam-prvs: <DM5PR04MB125918CE701D32D1050D69C6F6B90@DM5PR04MB1259.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(396003)(366004)(39860400002)(199004)(189003)(6246003)(4326008)(256004)(305945005)(14444005)(186003)(6512007)(9686003)(6862004)(6436002)(498394004)(2906002)(3846002)(8936002)(7736002)(6116002)(53936002)(54906003)(43066004)(8676002)(71190400001)(71200400001)(52116002)(55446002)(99286004)(95326003)(11346002)(6486002)(316002)(102836004)(66066001)(81156014)(81166006)(476003)(229853002)(64756008)(66556008)(4744005)(66946007)(66476007)(66446008)(478600001)(14454004)(5660300002)(486006)(53546011)(25786009)(386003)(6506007)(61266001)(76176011)(446003)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB1259;
 H:DM5PR04MB0381.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hheelBJXetgcPnsJPrJzshjAA7wdH7/7StW301D1mLGDgCqLO4xy9bUX3eH1rVT3B+8QbDtME1tzV/y6G6jCekY/L4BXiyo0vALQpFKa8C0gvoZ/J/a7ioN43gXyAzaasRcy5oN6ylxAsTSvdOFUX7Jig+eBDVFLbcnN0miXQmivRCQOE4K2rlot2J64qA4X8quZSy/+DCN1Ui6qhYfrAQX4V2W0mw6RvXcAHOmgGgIR3KTqC23Tg9TBVH88CGJiltmIPVzpuGIhP+Mn3m26I+leyGkDAoyif5h0poQ/QqXhmDHw4Gl4VcDiMF5RLxII+I/rHJyzH5b6+4P+yOCwQGIqsk8PM4JKwUVfd84OZ6vfL+B4ex7iUe5s0sGSgrJDnolG0yYjOMZJZMVxfCDU1REkyrHs5jecnNmqKr9w0rw=
x-ms-exchange-transport-forked: True
Content-ID: <BE7FD31611276546B811DCE49DD6B2EE@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498ec598-fac9-4d06-fc6d-08d730b92e63
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 21:53:40.4011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zem8N2naQNUBrVF80Yvv8bfZr6HUrhAjBoNwRBI7GXmQz5Tu6k7Kq/HCU7yZ9tuw6+iEujBrjpA06nwy7LMQPWHxxPjOpi2aCMzT9VBVirw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1259
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-03_05:2019-09-03,2019-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-1906280000 definitions=main-1909030217
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot <u-boot@lists.denx.de>, Joseph Hershberger <joseph.hershberger@ni.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 2/2] net: dwc_et_qos: update weak
 function board_interface_eth_init
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

On Thu, Aug 1, 2019 at 4:32 AM Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Align the board and driver prototype for board_interface_eth_init
> to avoid execution issue (the interface_type parameter is defined
> as int or phy_interface_t).
>
> To have a generic weak function (it should be reused by other driver)
> I change the prototype to use directly udevice.
>
> This prototype is added in netdev.h to allow compilation check
> and avoid warning when compiling with W=1 on file
> board/st/stm32mp1/stm32mp1.c
>
> warning: no previous prototype for 'board_interface_eth_init'\
> [-Wmissing-prototypes]
>      int board_interface_eth_init(int interface_type, ....
>          ^~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Acked-by: Joe Hershberger <joe.hershberger@ni.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
