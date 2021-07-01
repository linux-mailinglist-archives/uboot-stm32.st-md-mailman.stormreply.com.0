Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21E3B9448
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 17:48:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1193EC59781;
	Thu,  1 Jul 2021 15:48:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2104.outbound.protection.outlook.com [40.107.22.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 383CBC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 15:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGPDUw+ntVUQeulLppJYnLiUkmUPsNHW+Qrw4Jli0fdSiKk6PhyUOO3msJKRlwKisJUTvEmGnUEIP6T2iE7gABrfPAm7fpe4aFj60nUqJOw/1I3NZ/sp8Vtl6GGUkpNJBAGtcrTorp88GgE7bXoVk+JClz123CFsGp2jTw2p2jPuxBI9bDUb30btLWAljdk1PW8dzhIhS2YvWZVviX0z35t987lVm217Dysugzi244NEsZM9AE1bP6bS8uI+oGdNZPtVYQkeq4Ql41bdCdiTns4wJOogNj/L6TyAEOM/LlXsyBYzFWSiNtPpkK8DlOO/wAWg4ls05C98LpBjSDXr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsdlCSN3eUuudkWsWUlRKiyYyGatkup+vH9vOA9p9A4=;
 b=J989JNkQrji3uQTSEDPG6pNVxeAmI8I5BCkZzpi+ZjToT5hMgSZYPkSGBTQnVaF7IwvvFjgbzXxmEoWascHPzjXodDu2oe5VNHSOZsD7qqXMs+GIbn5qWspStnpb5peSMIIW6DGSQy6jPeu4YigNiGAhvJvZeSZEJDslbu593n0h9uSbWakvCh4WDlzh8Jnn+mFQ/c3XJPg7y6LoI9SOmYo1myP3XHIpvQff4sujctkYyWp+LiKPh6l2oV8bHvhTFlNkXfozNWTAHEXB32ufAJueW7B8brNKJ6gr+3CO8QqC3mk/jusKmVd1ByZT4fKc7PbS2h3kXQq8WiHAiIjCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hexagon.com; dmarc=pass action=none header.from=hexagon.com;
 dkim=pass header.d=hexagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hexagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsdlCSN3eUuudkWsWUlRKiyYyGatkup+vH9vOA9p9A4=;
 b=sgZZEXugk314Wdy6R9WXWhELncvI+//VAKTSP2CENoKTtA06Cx/j7blUcTWKAE9bh1ATu4UylQvAO+KOQKJifTefIMDOhh+V0kQZnq78ymn25Q/fzzfitmEnbZl2vn2D4AXEI+6y/QdciVGuEac9tIcvXHfqRJF03lgVV4Nt0b0=
Received: from DB6PR06MB3014.eurprd06.prod.outlook.com (2603:10a6:6:3::24) by
 DB7PR06MB4634.eurprd06.prod.outlook.com (2603:10a6:10:60::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22; Thu, 1 Jul 2021 15:48:20 +0000
Received: from DB6PR06MB3014.eurprd06.prod.outlook.com
 ([fe80::d845:7ab8:5653:4879]) by DB6PR06MB3014.eurprd06.prod.outlook.com
 ([fe80::d845:7ab8:5653:4879%6]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 15:48:20 +0000
From: Hexagon Email Recovery <email-recovery10@hexagon.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 0/7] stm32mp: cmd_stm32key: updates
Thread-Index: AQHXbpCEyTG56GpjMkyf5DIxHtafuA==
Date: Thu, 1 Jul 2021 15:48:20 +0000
Message-ID: <DB6PR06MB3014DEB3BFE416B9D2303C9C84009@DB6PR06MB3014.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-mail-application: Microsoft Power Automate; User-Agent:
 azure-logic-apps/1.0 (workflow 1c04d8943a3348d1a16448e57ef7f4c1; version
 08585764530080217437) microsoft-flow/1.0
x-ms-mail-operation-type: Send
x-ms-mail-environment-id: default-1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=hexagon.com;
x-originating-ip: [94.245.91.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1243d85d-6159-47a6-80f2-08d93ca7a69d
x-ms-traffictypediagnostic: DB7PR06MB4634:
x-microsoft-antispam-prvs: <DB7PR06MB46349603F60F70F99F4D772E84009@DB7PR06MB4634.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zeRh+cVwx4JASt/YFh8TjT6Dv5RS4RuXehJXNII4t94ymuOpJb589mEiGzgQRFZEex0hWdA+RtLfM2VX8eFZ6U+cxXP/H/YtRminSV41mpFN/gKdeCCi9npX2N5hc3ZQUXMf/FmTPGQ4MLqI6DDVQyxboWk+BsYojtcbgSvdi+CYkzo8lUnl6uVDB4BULfqhtfXFTd5fMNlSc/Dhp9etmgwm3crMUCtSUruZnXzDz25CgvlXsJJbJno5vxHmbU5ro4LI7fkT/d0LjjJTIIKB7jhzXSzKjCVFu9+taZjdpYMnuAH+UvpkV8T+ZM9Yz+NJkX5kPxypmNIw0rslkodXbV/d77ZZvrIMEXjpiickxBlyRQOQyYQbfRT58F7U9qfOi893KqZuwXu0DoqyYRT+TF8kqh08HX4t+DqvAvLd3OWEUtqVTaCLUHPh3sv7Rki1ZlPW2EIP3l4BEQjZs4DBuqaKggR6I63sNrEQJA9y2GITuQUO+hlYx43rriT+AkLRKh4EpT4gEuZUZJL3HECYYYVuFAwvR12DVkwN+NmRjfWz73P91IWXjY3jPUMHfd002DvFWj71JM+zLN++vNNwoJLutB1gPys+5LfamSI9Hff0+HX299N3wuYaiF5DYrUzmSTlR+viXK3DlNMyU5DC2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR06MB3014.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(83380400001)(6506007)(186003)(86362001)(26005)(122000001)(38100700002)(71200400001)(76116006)(66556008)(4326008)(7696005)(66946007)(66476007)(33656002)(64756008)(8676002)(45080400002)(66446008)(316002)(6916009)(52536014)(55016002)(5660300002)(54906003)(9686003)(8936002)(15650500001)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?mG1zSxw9sclUQl1tW4BVdh1TEaFPlIrZSu2InIk1Md9C7s0T23X+EjfG?=
 =?Windows-1252?Q?7Q21hPLycUSa2h5jeHXQ3HueVr7XP6RGNXJjWCeFLolor71nSKOnTCgT?=
 =?Windows-1252?Q?ZYh1D56oLLGD2K6VkjIPtaJK6Xc7gd6R3QOUOvIpvKdEvUrrr2+kxBpz?=
 =?Windows-1252?Q?WQNsjvGIizExb7ufoLW5SHEFYa7IeVXrMaT1EMrKpaFhtcxtvM0PQk0r?=
 =?Windows-1252?Q?y8h1L6yUGA5dEz4SIAUWFOcpaetez30/AMs3kZhRWSi6jEOtUwVFgRLA?=
 =?Windows-1252?Q?p2rVmaGusDQy+pNwJTjNkxzN8O4UMsyfmJTB675oY96szlo8RszqkHnq?=
 =?Windows-1252?Q?HloUMsyBDKMt0Bvc9YztI+/QfpDdqp74+WwWNOTD+PJhfCe+z6tV86ID?=
 =?Windows-1252?Q?B5hDBkbyu2FwtXRd796cZ+r3iHmn6LflznbJRnrTcJsIoq2fFhSEXX/J?=
 =?Windows-1252?Q?/AOSWS4uYD1ilDBUIRLHLhnpxYQbkCa1y2D4vxNjNCbEUxuL1Faw5hob?=
 =?Windows-1252?Q?iwc9nsElBYFf0Aud8kc0kZtAWJyY+1wps++OXn/jQpwU4Cn5hEFl2ur8?=
 =?Windows-1252?Q?L6UlZLLI3grmWCxO/rbyHLJXpNOmxvRpzr6GmcxXVuaPqRMZVILWbx/X?=
 =?Windows-1252?Q?4+XzticXHO3z/TRHxpV67bQbgHcyfyy8u/k8IA+YKzUxiiLxHufLz42z?=
 =?Windows-1252?Q?BkLliYypVec0NXDrK6xtHrj7LbBCJT5c0V5M14+Wp+l2PdpEEqq1DMH5?=
 =?Windows-1252?Q?wpg+q9oyy1DQmsv6lGL3tZVOvP2vOuhPzBX5JSjZmvDsNiiDMd4jDP5E?=
 =?Windows-1252?Q?wqp+U78H+1ZwJCK9Rv/7XBrnN5wksnFuLwoEKcIyvlLnOZTsJPdrZGuC?=
 =?Windows-1252?Q?g0fR/fJ0FUI3b2OqqSwu2XC+Lx+T4T6ivyszXe5/JoAdKCE7JkokLfga?=
 =?Windows-1252?Q?8JM1bxFNnVaQyWV/OqFqtutAI+szAi1sad686QezQY6FYVWz2y6UT5xC?=
 =?Windows-1252?Q?N9C9yn2xZ6Cmg4adCBH8tAb3DMSHGAtJe6+tee5ceIaAHCrXN2hOknhs?=
 =?Windows-1252?Q?hRATSP3YWWrdU/IE2K6lv0AX3Nch0PgHPDk099dAcnGK+cXDMmYGgAK5?=
 =?Windows-1252?Q?sAQ5Iff1gwv75Qft8Hk+QN7KEBVXflzfHH24WjYWKuVBkhRMFSBJ89FA?=
 =?Windows-1252?Q?fGnTEj1QCw+Pl9C+d8KMXDVFqhObaUbVspRYhTigbSWwViAPyaNBoOhm?=
 =?Windows-1252?Q?te7ikAdNXiZx3+IGtEqzqxxzhbPcrpkG4Mug6YVEAttk8F8QoS1TBJqz?=
 =?Windows-1252?Q?zhbgDfNTLoW99TS9PIn4XBem6ivo9u/UAPSJ2X41tSHp19kzhooGTYiw?=
 =?Windows-1252?Q?5Av5Q8Chm9+DDBTfOxr+Ve0Jc8uup/lFc/OxU7hTe+l1Sc4lfzBUJpUz?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hexagon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR06MB3014.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1243d85d-6159-47a6-80f2-08d93ca7a69d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 15:48:20.1531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6aCytk29TTpQFsZ7T1gwyzyXdllE4aNJYUPzzFQp1zi0HVfjAny/lfpDQF9VGdJfgdUPuO1BUgYJVU4zwyxvHlzd/pCpvbxOmIsOnsXioE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB4634
Cc: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 0/7] stm32mp: cmd_stm32key: updates
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
Reply-To: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>
Content-Type: multipart/mixed; boundary="===============2370685861973882511=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============2370685861973882511==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR06MB3014DEB3BFE416B9D2303C9C84009DB6PR06MB3014eurp_"

--_000_DB6PR06MB3014DEB3BFE416B9D2303C9C84009DB6PR06MB3014eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This message could not be delivered immediately due to an internal mail rou=
ting issue.
The mail routing error has been resolved in the meantime.
We apologize for the delay in delivery and any inconvenience this may have =
caused.
In case of any questions please contact us via it@hexagon.com.

Original sender: patrick.delaunay@foss.st.com
Original delivery time: 28-Jun-2021 01:28 PM (UTC)
---------------------------------------------------------------------------=
--------------------------------------------
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Severa=
l improvements and protection on the command stm32key. This command is used=
 to experiment the secure boot on STM32MP15x; the expected sequence to manu=
ally activate it with this U-Boot command is: - Key generation with STM32 K=
eyGen tool - Key registration: update and lock PKH in OTP (stm32key fuse) -=
 Perform image authentication of an image signed with STM32 Signing tool an=
d check that the ROM code accepted them - Close the device, only signed bin=
ary will be accepted (stm32key close) Warning: Make sure that a device with=
 Secure boot enabled is used, check the security field of the chip part num=
ber. Otherwise the chip will be bricked and could not be used anymore. This=
 command is activated by default on STMicroelectronics evaluation boards bu=
t these OTP can also be updated directly by customer application or with Se=
cure Secret Provisioning (SSP). Patrick Delaunay (7): stm32mp: configs: act=
ivate the command stm32key only for ST boards stm32mp: cmd_stm32key: use su=
b command stm32mp: cmd_stm32key: handle error in fuse_hash_value stm32mp: c=
md_stm32key: lock of PKH OTP after fuse stm32mp: cmd_stm32key: add get_misc=
_dev function stm32mp: cmd_stm32key: add read OTP subcommand stm32mp: cmd_s=
tm32key: add subcommand close arch/arm/mach-stm32mp/Kconfig | 4 +- arch/arm=
/mach-stm32mp/cmd_stm32key.c | 239 +++++++++++++++++++++++---- configs/stm3=
2mp15_basic_defconfig | 1 + configs/stm32mp15_trusted_defconfig | 1 + 4 fil=
es changed, 208 insertions(+), 37 deletions(-) -- 2.25.1

--_000_DB6PR06MB3014DEB3BFE416B9D2303C9C84009DB6PR06MB3014eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<p>This message could not be delivered immediately due to an internal mail =
routing issue.<br>
The mail routing error has been resolved in the meantime.<br>
We apologize for the delay in delivery and any inconvenience this may have =
caused.<br>
In case of any questions please contact us via it@hexagon.com.<br>
<br>
Original sender: patrick.delaunay@foss.st.com<br>
Original delivery time: 28-Jun-2021 01:28 PM (UTC)<br>
---------------------------------------------------------------------------=
--------------------------------------------<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Severa=
l improvements and protection on the command stm32key. This command is used=
 to experiment the secure boot on
 STM32MP15x; the expected sequence to manually activate it with this U-Boot=
 command is: - Key generation with STM32 KeyGen tool - Key registration: up=
date and lock PKH in OTP (stm32key fuse) - Perform image authentication of =
an image signed with STM32 Signing
 tool and check that the ROM code accepted them - Close the device, only si=
gned binary will be accepted (stm32key close) Warning: Make sure that a dev=
ice with Secure boot enabled is used, check the security field of the chip =
part number. Otherwise the chip
 will be bricked and could not be used anymore. This command is activated b=
y default on STMicroelectronics evaluation boards but these OTP can also be=
 updated directly by customer application or with Secure Secret Provisionin=
g (SSP). Patrick Delaunay (7): stm32mp:
 configs: activate the command stm32key only for ST boards stm32mp: cmd_stm=
32key: use sub command stm32mp: cmd_stm32key: handle error in fuse_hash_val=
ue stm32mp: cmd_stm32key: lock of PKH OTP after fuse stm32mp: cmd_stm32key:=
 add get_misc_dev function stm32mp:
 cmd_stm32key: add read OTP subcommand stm32mp: cmd_stm32key: add subcomman=
d close arch/arm/mach-stm32mp/Kconfig | 4 +- arch/arm/mach-stm32mp/cmd_stm3=
2key.c | 239 +++++++++++++++++++++++---- configs/stm32mp15_basic_defconfig =
| 1 + configs/stm32mp15_trusted_defconfig
 | 1 + 4 files changed, 208 insertions(+), 37 deletions(-) -- 2.25.1 </p>
</body>
</html>

--_000_DB6PR06MB3014DEB3BFE416B9D2303C9C84009DB6PR06MB3014eurp_--

--===============2370685861973882511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2370685861973882511==--
