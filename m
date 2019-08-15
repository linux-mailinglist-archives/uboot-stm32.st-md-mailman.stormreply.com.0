Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F02C8EFD7
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Aug 2019 17:56:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F029C36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Aug 2019 15:56:31 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6773BC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Aug 2019 15:56:29 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
 by mx0b-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x7FFuC6g012254
 for <uboot-stm32@st-md-mailman.stormreply.com>; Thu, 15 Aug 2019 10:56:23 -0500
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
 by mx0b-00010702.pphosted.com with ESMTP id 2ubf80h31m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Thu, 15 Aug 2019 10:56:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEIiLkehbIWm4aKbNsUZp4HdPx9w7PBjWvqdDD6sVpyNQ/grXUJla0LuJPwE8cwchMObpLn8VThe/t1BhxpW9OvpOlA4Kg0PbdLPsoFyog3p0+0INYyMQ+jI5MgWReEte7w0tnnOXoA/9fD9TxQQ46WjBrm8BcaOOQkMVhiOS6tlY0v9KhoHojKmCZTcPF9HiLM4W6qhcKA+NSnEdVSfe+m/I4KKg88jJUnt0CYMuwe8QzB6yJ+Y7D4bNiO+EWgMI3dxfegLXB29ynCgOUfZY6Biwt17oStewUuwVJoS4q7LLxPjDH0gFtnv32umejaMzMgD8gauC9g/kSivyrKB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvWSS/G0zMlWhkbg+RqEJZTmH5VX/qTonIgC11Ib578=;
 b=T6XQ+v9l3tMz+KQdoRgMikgWWoqZiBnkfc5dIyPwJmq+wxdmB4xTh1WPbeXdIFmzE0sBheyCAmL9L/Hx9Y4F2k3nsSQyxhNU04S0vsOzThI1pY4g5BZZUOs0N3Z+If0wHOc2c7qH6p5m4bzxcguxaONp96zVcyy+FbPMSr/l3l76wi8mSPBWUx5qi9+A4fiX+IhlmBJgIZTA6G9qKuzAYb4PRL5acN4AMvseuwIefECyxU/ZIyXiStx/FKnwddEXoPI80aZq+oJhRVCY+ZqTCmJJ9JAYMtAGJYdoDqETa18+b59p+knCpQ7TP9pslWB5lC6VAO64oq9b8BeBppexTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvWSS/G0zMlWhkbg+RqEJZTmH5VX/qTonIgC11Ib578=;
 b=Ur8FtcgLhPRhUATDb04U92Hy9WFSkW3RfdKQJCgzMsx4TcNYjkpTgEG+rTsQuN5dE957hAJPTNILZP+V2sDNAZ7tEydj1f4qQsKEB/7h1aBECPcZRQC7UMhpiY4YpBqYCz+DYxXbLYTzapTI3s3JZkoBemjTiOOE0qK6bBd1d7Q=
Received: from DM5PR04MB0381.namprd04.prod.outlook.com (10.173.169.144) by
 DM5PR04MB0268.namprd04.prod.outlook.com (10.168.233.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Thu, 15 Aug 2019 15:56:18 +0000
Received: from DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::fcdd:2dc6:efc8:1867]) by DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::fcdd:2dc6:efc8:1867%11]) with mapi id 15.20.2157.022; Thu, 15 Aug
 2019 15:56:18 +0000
From: Joe Hershberger <joe.hershberger@ni.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Thread-Topic: [U-Boot] [PATCH 1/2] net: dwc_eth_qos: Change eqos_ops function
 to static
Thread-Index: AQHVU4H5MJ5NqiP1kEGhyxDduKswwQ==
Date: Thu, 15 Aug 2019 15:56:18 +0000
Message-ID: <CANr=Z=YWC_PixtQh2zhOFJ62UxtnjSTK5fAZRm2v6b3sUJ_ciQ@mail.gmail.com>
References: <1564651743-28430-1-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564651743-28430-1-git-send-email-patrick.delaunay@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR12CA0002.namprd12.prod.outlook.com
 (2603:10b6:610:57::12) To DM5PR04MB0381.namprd04.prod.outlook.com
 (2603:10b6:3:9e::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAVo2JHtUbfbiTXG4D1Nvkt8VeM7LCCoXxN10CQWVJ3lcCLULoy0
 I5fmxp6mQat97Omdx+fZTSw04kSKgKulkkYHJHY=
x-google-smtp-source: APXvYqxSwIudgegtDZOdkBw4PyHy8xWMyJX2QQzOPBL2uFexdqYrK9xBwS890lJgowE8jRqfjbqNhP2oIENVkEMB/oI=
x-received: by 2002:a6b:ee12:: with SMTP id i18mr5989075ioh.172.1565884577028; 
 Thu, 15 Aug 2019 08:56:17 -0700 (PDT)
x-gmail-original-message-id: <CANr=Z=YWC_PixtQh2zhOFJ62UxtnjSTK5fAZRm2v6b3sUJ_ciQ@mail.gmail.com>
x-originating-ip: [209.85.166.47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05bcf04b-0359-46a2-e108-08d721991c13
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR04MB0268; 
x-ms-traffictypediagnostic: DM5PR04MB0268:
x-microsoft-antispam-prvs: <DM5PR04MB0268109A1248D04180331791F6AC0@DM5PR04MB0268.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(376002)(366004)(396003)(199004)(189003)(95326003)(558084003)(498394004)(2906002)(8676002)(229853002)(81166006)(43066004)(64756008)(66556008)(81156014)(66476007)(66946007)(66446008)(476003)(6486002)(61726006)(99286004)(6116002)(26005)(6436002)(3846002)(186003)(54906003)(486006)(316002)(11346002)(446003)(76176011)(256004)(102836004)(8936002)(6862004)(7736002)(5660300002)(14444005)(4326008)(305945005)(52116002)(478600001)(66066001)(6506007)(386003)(53546011)(53936002)(6246003)(61266001)(55446002)(25786009)(14454004)(71200400001)(6512007)(71190400001)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0268;
 H:DM5PR04MB0381.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a8SG+/hWz8w54n7sFdPDheKulye86t/Ivs8vWnT4qrZ7WELMzew8HXrHEU5o0zrrX9aEyoiTjyA7ZNH3vg4TG7xOJlUO3mMGvizWAR27WM4PyUuo8Emepek8V6jAtNLjeNnMUh0UQ9ASRXGGg32L15T5MBdq9fGBNja/x2UP9Y50W6Ya/q1Uvmd9h3C0SNvAAFaDf58tFudlquPasDmMo4Jsm/cfyVXbOxmmAcjrTSqUhSsYFGN0jla1lJNRCOJHgLKs4sOnpbdZCPIsuM74/7mt16z7JalZPiUQVL47C5l36/eAhq8fJoim3comXdlV9EQ2ANa5Rk3g6sbO/+rLeH780qK9V4ktIlnn2FZPeO0j+xtKYWh3Em7GO6Xwufu8uYIaDn8zP64oK7jhLDaSIF/N6/RKZC1728IeozAXmXc=
x-ms-exchange-transport-forked: True
Content-ID: <C647D89CC30E524F96ECA2BC90E05286@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bcf04b-0359-46a2-e108-08d721991c13
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 15:56:18.5550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cfFAb3LO3Bv5blRBUgTAnlkdCJeZcgijhqbA0XU8882Mjow5MzdvsMyUB1s0kuomoRR/trA/JguIx2P1/Eli6AT3KC3GbUa768H0P3tNwSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0268
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:5.22.84,1.0.8
 definitions=2019-08-15_06:2019-08-14,2019-08-15 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30 mlxscore=0
 clxscore=1011 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-1906280000 definitions=main-1908150156
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot <u-boot@lists.denx.de>, Joseph Hershberger <joseph.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 1/2] net: dwc_eth_qos: Change
 eqos_ops function to static
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

On Thu, Aug 1, 2019 at 4:31 AM Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> This patch solves many warnings when compiling with W=1:
> warning: no previous prototype for '....' [-Wmissing-prototypes]
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Acked-by: Joe Hershberger <joe.hershberger@ni.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
