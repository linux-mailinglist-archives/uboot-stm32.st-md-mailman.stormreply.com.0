Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77368102D19
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Nov 2019 20:58:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F81BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Nov 2019 19:58:09 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CC89C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2019 19:57:22 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
 by mx0b-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJJttn7002014; Tue, 19 Nov 2019 13:57:14 -0600
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2059.outbound.protection.outlook.com [104.47.46.59])
 by mx0b-00010702.pphosted.com with ESMTP id 2waftbgt9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 13:57:14 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCVwNzijX553lWt2BD7IYZzsluUzMvSTQLR684Xtep6+VssXMcSwYsdHlPw+5+DMHp/Sb2hNZVq3jVrs0908+BTDGPGzyZu2cLnX6pL1l8vkxV2knla9UVsZ+fGjtQPKiun/MBcSpA9p9w05ahoARkJETAwxpyrIPzpAzwTxV3SccNF8I42+DwWEme0K/bLJYw2nBvtp2hbgG0puEBUW5NoeoO/qK8aeUu/wTjuTVT91RW5T0mQGLZtGA8BSSZzUG6sb98KeXl4BfcsePkB16kSrGp1B7jRA0fRI3CVeU44il83pHKCTtiI3EE/E7qt4tjm9KcKnBKy6eWQDfPoTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9ePUAodBaVrwrN5sPWeU5SWqkSosGaPM15+qRXMbtk=;
 b=NPhAqGW+Xip0uvujCVLZV/wJ4T0rG7Nx6BLzwKEtOLtOWCr6Q/5eSecumnYrvQfq5KJIOp8PVHiT8m7Z6Bx0EwR+7ZjuKmBf/WPnQgMbohBR/voZOctKJthTyfvf+Tsr+dOUxejJ3dX+u/Dlksoj6XW/jSev59fpYXQ3nx3dYodu5EETIuzF6DFLYOsJpIBEHeD3VFbWl6JkXxT0dqSH/Wlb6WJ+yL8UBfXoL1uqCPW+g3RuIE0b2CfkISdnu7qsTGJOGkW55NR+gnk3671cS13t0HivXGi3KZE8vrIh6/iVQi5zYCHh3q0VDWSgIsAo6zBjHegFCjg30rmhCMx+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9ePUAodBaVrwrN5sPWeU5SWqkSosGaPM15+qRXMbtk=;
 b=dayO6nB98sLnIkjhWgzzKoUdIvPDMouYQ1214CLl5HhL7RqCkhYmrmaxcLmU1qYtLrM0Vf/COKJlrem1QJe/KFxnptF0QDYWy1tz/su2jBVHlkDrRq8XxQQY5Yfhlt9Sxd92HUZ44/A8Uq9vpulo6zHaY3hDs40T0d2ItD3Q5T8=
Received: from CY4PR04MB0376.namprd04.prod.outlook.com (10.173.195.8) by
 CY4PR04MB0457.namprd04.prod.outlook.com (10.173.194.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Tue, 19 Nov 2019 19:57:11 +0000
Received: from CY4PR04MB0376.namprd04.prod.outlook.com
 ([fe80::cd76:aad0:e059:2d6d]) by CY4PR04MB0376.namprd04.prod.outlook.com
 ([fe80::cd76:aad0:e059:2d6d%5]) with mapi id 15.20.2451.029; Tue, 19 Nov 2019
 19:57:11 +0000
From: Joseph Hershberger <joseph.hershberger@ni.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [EXTERNAL] [PATCHv2 5/5] env: Finish migration of common ENV
 options
Thread-Index: AQHVnnUUCp3fu5He2UureCgCZYcsH6eS6IFw
Date: Tue, 19 Nov 2019 19:57:11 +0000
Message-ID: <CY4PR04MB0376EA17E3006DFD73945578F64C0@CY4PR04MB0376.namprd04.prod.outlook.com>
References: <20191119010210.24477-1-trini@konsulko.com>
 <20191119010210.24477-5-trini@konsulko.com>
In-Reply-To: <20191119010210.24477-5-trini@konsulko.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.164.62.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eec3d09a-0465-4462-967b-08d76d2aaaba
x-ms-traffictypediagnostic: CY4PR04MB0457:
x-microsoft-antispam-prvs: <CY4PR04MB0457EBD4364BB70FBCD0B271F64C0@CY4PR04MB0457.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(136003)(396003)(346002)(39860400002)(13464003)(199004)(189003)(478600001)(99286004)(256004)(6506007)(74316002)(9686003)(6246003)(7696005)(26005)(4326008)(54906003)(110136005)(14454004)(7736002)(53546011)(66476007)(66556008)(66446008)(64756008)(81166006)(66946007)(2501003)(8676002)(446003)(66066001)(11346002)(86362001)(81156014)(33656002)(8936002)(6436002)(186003)(52536014)(229853002)(76116006)(102836004)(305945005)(486006)(316002)(5660300002)(76176011)(6116002)(71200400001)(25786009)(44832011)(71190400001)(2906002)(55016002)(3846002)(476003)(21314003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0457;
 H:CY4PR04MB0376.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BtTtL7b9osVu3pZLXhFpDHmpQkisO8baGb568YVFqwZEworoIQi8yh5k4kjQtlE4xk50xtsdDS2B44fSlVZqABVZ/9fXDuJrb9ThrJgproMWEqx78glbX1omMV97M/Wrke3dx1WQZptMfUyTUFQ2U8ImwHSH9fkTdxz8dkTQUYw2ccwAmW5dFZmx5p+5NkoqbaITTGlenG0gUA3UM9i+7583hDonwmFh1HbHXNUSawX3cRzAMcCM2HcG/G+6c58O4h59ua2TuA891zC+J9FaU3Up/ORYnffKDG+8eiJNwgZYIFQRFAx5Op9KsuZqxfPBpG/8P83R+LXBjJ7aOJcB0awO55yXVSpokH9ukNi5Qee5TMifiP3UPP7oP0p2hHVHzb3rUcmP2dXXgvvXTaFey7Xa0YzejXeucYQd0PlDrtfCCkuSzhj5ETV2EkDgELHw
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec3d09a-0465-4462-967b-08d76d2aaaba
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 19:57:11.5474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShP/igD1/FRwIj+LjBl7lo4A/nJ4+r/QkX+qIdK4xhbXUP2VzT59cEWVFugJZrzMp9MfoZjDiBamqO2mb9J094aM+VbCxXD01jVeowMN/LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0457
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_06:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=848 adultscore=0
 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911190163
X-Mailman-Approved-At: Tue, 19 Nov 2019 19:58:08 +0000
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCHv2 5/5] env: Finish migration of common ENV
	options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

> -----Original Message-----
> From: Tom Rini <trini@konsulko.com>
> Sent: Monday, November 18, 2019 7:02 PM
> To: u-boot@lists.denx.de
> Cc: Wolfgang Denk <wd@denx.de>; Joseph Hershberger
> <joseph.hershberger@ni.com>; Patrick Delaunay
> <patrick.delaunay@st.com>; uboot-stm32@st-md-mailman.stormreply.com
> Subject: [EXTERNAL] [PATCHv2 5/5] env: Finish migration of common ENV
> options
> 
> - In ARMv8 NXP Layerscape platforms we also need to make use of
>   CONFIG_SYS_RELOC_GD_ENV_ADDR now, do so.
> - On ENV_IS_IN_REMOTE, CONFIG_ENV_OFFSET is never used, drop the
> define
>   to 0.
> - Add Kconfig entry for ENV_ADDR.
> - Make ENV_ADDR / ENV_OFFSET depend on the env locations that use it.
> - Add ENV_xxx_REDUND options that depend on their primary option and
>   SYS_REDUNDAND_ENVIRONMENT
> - On a number of PowerPC platforms, use SPL_ENV_ADDR not
> CONFIG_ENV_ADDR
>   for the pre-main-U-Boot environment location.
> - On ENV_IS_IN_SPI_FLASH, check not for CONFIG_ENV_ADDR being set but
>   rather it being non-zero, as it will now be zero by default.
> - Rework the env_offset absolute in env/embedded.o to not use
>   CONFIG_ENV_OFFSET as it was the only use of ENV_OFFSET within
>   ENV_IS_IN_FLASH.
> - Migrate all platforms.
> 
> Cc: Wolfgang Denk <wd@denx.de>
> Cc: Joe Hershberger <joe.hershberger@ni.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Tom Rini <trini@konsulko.com>

Wow! That was a big one!

Acked-by: Joe Hershberger <joe.hershberger@ni.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
