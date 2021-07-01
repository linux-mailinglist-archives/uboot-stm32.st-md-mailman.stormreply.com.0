Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2E33B9270
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 15:41:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44B2EC59781;
	Thu,  1 Jul 2021 13:41:13 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10117.outbound.protection.outlook.com [40.107.1.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78A43C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 13:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4mx5cgL91/ih2d3/A1ijtc5NgNC5xg2u6ERRPAen9YWmhW6WJe/GiLOAyM4S5TVBAHcyP1gas+haDe3S4K5BhFibIW5iskBcvQOry1J91IbSwb0xM5Mu0Ee3F06hc1/jCFhJrcsSJe4PP1blajBGRi90d/W0+o1jWMR10LjXnqXBFbn+s4goB/hae/WTvH7QwrF0iiGtf391llDILM4+UNC8xyYYvaPRpwl5Rt84nt34UQkjlpGqp660KzkWf9ZNPS0+APIusLTG7QIY80y07d7aLRID1JrK99yOw2mOcaXwFGViCtLozqU22OyLUGa6Qe1ZmfDOj/BRyDaugChgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ0mJcsYdFV9gmvNw7EImg94ycoF0JHseCnmYJWiJ3A=;
 b=XYGwMPlM22KJFK6fL/TjiX9FpYGHefGxKLnnbavlsgdUIIBgbO0ihA+DSHZF3CD34lPZ3jLysMGQShpsHmmK2f07ixg1EwNwHW39vw6rvwKjWhfmFzIyGa0uUz80Ppd/jqy25ZMnFT1CpVuCOifV8GBHQIw0fQyQzV8eg+TNhFNdR17lxWvlrvU9lmPcFwHJQ+p63ONE6sGQ/ZUyuwbe/VJD8FbSa6yYUxIWqGKbhjCkZ6IO3HEh3UUkyvMnQRGNaziSIZvZtZNvs1kySLSRSfWu3A3bvRxvbYzuJ5O0hzBuCzvWlIhe6KPc3ctTOjk7bbpZ2BM0xfNLItC7KS2HQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hexagon.com; dmarc=pass action=none header.from=hexagon.com;
 dkim=pass header.d=hexagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hexagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ0mJcsYdFV9gmvNw7EImg94ycoF0JHseCnmYJWiJ3A=;
 b=qVij2NNjCQVZ/e2aZGgnWpDfWfWebRh6D/0g9t7Cv408L5dptvaY8en92sDtF2caPLikbWS56zWJ4c3fSpg4WURrBM36ImyehopPLxzbFfbuD/ubYzplRTRQ+Rg3267r92BSMs0UHG4nVSdMjVqZrAvc02QTCXK/986Lvh5frWM=
Received: from AM0PR06MB6178.eurprd06.prod.outlook.com (2603:10a6:208:16c::27)
 by AM8PR06MB7586.eurprd06.prod.outlook.com (2603:10a6:20b:315::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 13:41:10 +0000
Received: from AM0PR06MB6178.eurprd06.prod.outlook.com
 ([fe80::78aa:adee:acad:6104]) by AM0PR06MB6178.eurprd06.prod.outlook.com
 ([fe80::78aa:adee:acad:6104%5]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 13:41:10 +0000
From: Hexagon Email Recovery <email-recovery4@hexagon.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/7] stm32mp: cmd_stm32key: handle error in
 fuse_hash_value
Thread-Index: AQHXbn7A+eSYIChiwEeWbQTkoC+bJQ==
Date: Thu, 1 Jul 2021 13:41:10 +0000
Message-ID: <AM0PR06MB61786468730F600995BADBD6B1009@AM0PR06MB6178.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-mail-application: Microsoft Power Automate; User-Agent:
 azure-logic-apps/1.0 (workflow 860ad96c0b444dc99214a54c93918663; version
 08585764630720889319) microsoft-flow/1.0
x-ms-mail-operation-type: Send
x-ms-mail-environment-id: default-1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=hexagon.com;
x-originating-ip: [94.245.91.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ebfec73-5339-4c91-7fbc-08d93c95e2cc
x-ms-traffictypediagnostic: AM8PR06MB7586:
x-microsoft-antispam-prvs: <AM8PR06MB75861696833CD705ECB821A9B1009@AM8PR06MB7586.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0by4GJrQm5PNzeRPZgToHq32ssr8Xp0xpqlvcfZ1wbhdDTvXMtyNl7J6QXggEbTw3FSHzhAGjPkRBku27Qa7idgO8pE0pIKWKudSSqxSjBt6gMDJGwb5Y9Q4NXzr12ZencvtGJqL6xHq1e5bi4dltQIAAMvLpbpRPFoP6FjSjql5RGMhsw1VPlzr2Pap+1aZGvOBZgZClT6Huhu21es/dsQSDA2ZjCl3jdvxr/w7bVP8MaDaWRjgR3PYJVNcIo2I74ZC/4WrcD9LCSQ/3BYfMFKJ13D3dXoI+z/KaGqueTSoQag/D4TK+E8YTshMTtFjDI8j9pYt07YshH9m9AJfvNo72DzpjOFUmsLiqrJIY3KUi8t3oCWz4lbn9Ue9tgPxox9wtNoTf0HCS5QI0ZptUohGgx8SnsofMMQUqfqQQxCDEEPd0fv+mVUKy9rvOHAayjdk1PVhi4iddQi5338i1xEL3pRJ+m6ROIXQwDtPO1Xb1PvXHrjCIsJwRSMR407k0fSo0GYIUGFW64B+sFz5ZHzu5qhZ0y08MpCkr/PNa17v6heJ9dw32SNxF6Zy1pktv4ASmBvuhhu41wcB0GG7stnxnbdYSaH4e1zgcenqfyU5gmNpbcFFIB3ogy5F9NFKsoSpNO0w96EiTKPUAOu23Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR06MB6178.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(6916009)(71200400001)(38100700002)(55016002)(122000001)(54906003)(86362001)(91956017)(76116006)(66946007)(9686003)(8936002)(66446008)(66476007)(64756008)(8676002)(33656002)(66556008)(5660300002)(45080400002)(6506007)(7696005)(498600001)(83380400001)(186003)(4326008)(52536014)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?aqY/XzaybigodImq6FvTNWRr9Ujfxlv8rxL1jbxPhITrOWDJqJ2qZ7Pj?=
 =?Windows-1252?Q?yPy+Sru1hdQF/Rt0vYJvbi3j0SaUw2T9+7M8QUidnx5l313VQ2eVM25c?=
 =?Windows-1252?Q?WWEQcA11rMoUlTS7qImA0Eh/RUspohBMsc/VICqnRBu0lQh8Pd53RtEc?=
 =?Windows-1252?Q?jc4I5nw2/XGafGtdm+jQPa1mxrri5vdCI/eumctYOE3jwazOdLAfzBV8?=
 =?Windows-1252?Q?IlATqPOlBo5/01B+cF1mwAPDo4kk72QWL7A9MSMk/vO3Ac2rreHZJxWd?=
 =?Windows-1252?Q?8EnYPnOmJLjiE3sJR/VdOJLCop4oRI/hs2+sRimbh5Dyg1W9FdhlTSxT?=
 =?Windows-1252?Q?AiJVMd+aqDAiSzrBTewMpJgzaigQdXMb+K3P3FDSUj2S3BJDntlOVKNS?=
 =?Windows-1252?Q?9+EZVMNPM4q4A7tgsGDoNrRBU9e6Md1ILJ2ot9M98negKESYs8lGawJG?=
 =?Windows-1252?Q?CI4NBG6rxOC9f9owu4DdDLY3TTCAfLqiOtUolLaJUHInRt7wre3LIFAW?=
 =?Windows-1252?Q?lxSgyF3/E4FlDWd9lCaen3F3ythIXUVUWFc7gyN1nkseeb0Y4mYi8uRg?=
 =?Windows-1252?Q?oPJCb7PtHVi1jPHpqVmVVhUlVY8t8eSGuo8D4ZalbAWsyrsQJcKgJ5f2?=
 =?Windows-1252?Q?/WE31bd2vXwvTJaenHYxLN5mD1bWxAlnI37iV1RFVhXO1n4wmK8Rgs58?=
 =?Windows-1252?Q?FCQEfS/WF1B984gkoc2OA8sed2RulTzOSZ+JTiGjbbKNUO9XOZUI/zD4?=
 =?Windows-1252?Q?AJ7UIb3v8D3nJwFN9O+I0r0hAynqchT+ngSNUumTnmsIQV3933LWosiS?=
 =?Windows-1252?Q?3LUTp1zFIB+ftRE77AXyHWN2u8Enmls1LONP3SQQXTI8fnFWhXafWNrL?=
 =?Windows-1252?Q?vanOZ1OEepaa7AnePucvnQvViuWNTBBTYQbFJ91B+rpqh541xh0kJYkQ?=
 =?Windows-1252?Q?Ns+OCE3Pv21VwiSAiZd+2JHU/CQcWp/rX/WXn7jT+7kjB7sbD5ESP5G0?=
 =?Windows-1252?Q?kC+aDONeq9OHd3PFC1jAjL8AVpJU0tdVcimH7Zd3XYSy53GZA8kBuo15?=
 =?Windows-1252?Q?Ck+Gj8z1XD1BXqo8KkToftwi2dnjyJp0Wf5KoLkC34eVXdMivoptBH+W?=
 =?Windows-1252?Q?3X2DiqKPIHeCvU2o0Onng6+ipp+kQ6OHyaFX4UtG0a/pH2XlS4IqdemV?=
 =?Windows-1252?Q?yQvXQL1pTylmJ9MvusRWKlDXbP5C61E5/yzISMdVzwly4IAXxW474NMX?=
 =?Windows-1252?Q?JMC4ib60XugBLpDJYc+1zPezxrsblFK2+9G9z01xAAg6XaIv3aUkC5py?=
 =?Windows-1252?Q?tgNLbLjyVkxUt1H5ppYe4voYOus/6ihhKjIUXEQSePva/sw/RxG6Lzyk?=
 =?Windows-1252?Q?AH1cd244HTPIsRnOkIHsfjRyxZ+qRGxijC22cU2uw9vdceTNTBgcF1ab?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hexagon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB6178.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebfec73-5339-4c91-7fbc-08d93c95e2cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 13:41:10.0923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cdh0GcNeY+KljPRXrCVFBwByfLPIrSb+dLKnqe6J/M+emXXeQrPlPQoISuC9MTOMrUkoPpGWdyZXGgcbiTDxlUF66HUcIRY3xu+NZZLoLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7586
Cc: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/7] stm32mp: cmd_stm32key: handle error in
	fuse_hash_value
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
Content-Type: multipart/mixed; boundary="===============4566999939377311342=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============4566999939377311342==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR06MB61786468730F600995BADBD6B1009AM0PR06MB6178eurp_"

--_000_AM0PR06MB61786468730F600995BADBD6B1009AM0PR06MB6178eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This message could not be delivered immediately due to an internal mail rou=
ting issue.
The mail routing error has been resolved in the meantime.
We apologize for the delay in delivery and any inconvenience this may have =
caused.
In case of any questions please contact us via it@hexagon.com.

Original sender: patrick.delaunay@foss.st.com
Original delivery time: 28-Jun-2021 01:03 PM (UTC)
---------------------------------------------------------------------------=
--------------------------------------------
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Handle=
 errors in fuse_hash_value function. Signed-off-by: Patrick Delaunay --- ar=
ch/arm/mach-stm32mp/cmd_stm32key.c | 24 +++++++++++++++--------- 1 file cha=
nged, 15 insertions(+), 9 deletions(-) diff --git a/arch/arm/mach-stm32mp/c=
md_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c index d2045a5983..2529=
139ebc 100644 --- a/arch/arm/mach-stm32mp/cmd_stm32key.c +++ b/arch/arm/mac=
h-stm32mp/cmd_stm32key.c @@ -25,7 +25,7 @@ static void read_hash_value(u32 =
addr) } } -static void fuse_hash_value(u32 addr, bool print) +static int fu=
se_hash_value(u32 addr, bool print) { struct udevice *dev; u32 word, val; @=
@ -36,21 +36,25 @@ static void fuse_hash_value(u32 addr, bool print) &dev);=
 if (ret) { log_err("Can't find stm32mp_bsec driver\n"); - return; + return=
 ret; } for (i =3D 0; i < STM32_OTP_HASH_KEY_SIZE; i++) { - if (print) - pr=
intf("Fuse OTP %i : %x\n", - STM32_OTP_HASH_KEY_START + i, - __be32_to_cpu(=
*(u32 *)addr)); - word =3D STM32_OTP_HASH_KEY_START + i; val =3D __be32_to_=
cpu(*(u32 *)addr); - misc_write(dev, STM32_BSEC_OTP(word), &val, 4); + if (=
print) + printf("Fuse OTP %i : %x\n", word, val); + + ret =3D misc_write(de=
v, STM32_BSEC_OTP(word), &val, 4); + if (ret !=3D 4) { + log_err("Fuse OTP =
%i failed\n", word); + return ret; + } addr +=3D 4; } + + return 0; } stati=
c int confirm_prog(void) @@ -104,7 +108,9 @@ static int do_stm32key_fuse(st=
ruct cmd_tbl *cmdtp, int flag, int argc, char *con if (!yes && !confirm_pro=
g()) return CMD_RET_FAILURE; - fuse_hash_value(addr, !yes); + if (fuse_hash=
_value(addr, !yes)) + return CMD_RET_FAILURE; + printf("Hash key updated !\=
n"); return CMD_RET_SUCCESS; -- 2.25.1

--_000_AM0PR06MB61786468730F600995BADBD6B1009AM0PR06MB6178eurp_
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
Original delivery time: 28-Jun-2021 01:03 PM (UTC)<br>
---------------------------------------------------------------------------=
--------------------------------------------<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Handle=
 errors in fuse_hash_value function. Signed-off-by: Patrick Delaunay
<patrick.delaunay@foss.st.com>--- arch/arm/mach-stm32mp/cmd_stm32key.c | 24=
 +++++++++++++++--------- 1 file changed, 15 insertions(+), 9 deletions(-) =
diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/c=
md_stm32key.c index d2045a5983..2529139ebc
 100644 --- a/arch/arm/mach-stm32mp/cmd_stm32key.c +++ b/arch/arm/mach-stm3=
2mp/cmd_stm32key.c @@ -25,7 +25,7 @@ static void read_hash_value(u32 addr) =
} } -static void fuse_hash_value(u32 addr, bool print) +static int fuse_has=
h_value(u32 addr, bool print) {
 struct udevice *dev; u32 word, val; @@ -36,21 +36,25 @@ static void fuse_h=
ash_value(u32 addr, bool print) &amp;dev); if (ret) { log_err(&quot;Can't f=
ind stm32mp_bsec driver\n&quot;); - return; + return ret; } for (i =3D 0; i=
 &lt; STM32_OTP_HASH_KEY_SIZE; i++) { - if (print)
 - printf(&quot;Fuse OTP %i : %x\n&quot;, - STM32_OTP_HASH_KEY_START + i, -=
 __be32_to_cpu(*(u32 *)addr)); - word =3D STM32_OTP_HASH_KEY_START + i; val=
 =3D __be32_to_cpu(*(u32 *)addr); - misc_write(dev, STM32_BSEC_OTP(word), &=
amp;val, 4); + if (print) + printf(&quot;Fuse OTP %i :
 %x\n&quot;, word, val); + + ret =3D misc_write(dev, STM32_BSEC_OTP(word), =
&amp;val, 4); + if (ret !=3D 4) { + log_err(&quot;Fuse OTP %i failed\n&quot=
;, word); + return ret; + } addr +=3D 4; } + + return 0; } static int confi=
rm_prog(void) @@ -104,7 +108,9 @@ static int do_stm32key_fuse(struct
 cmd_tbl *cmdtp, int flag, int argc, char *con if (!yes &amp;&amp; !confirm=
_prog()) return CMD_RET_FAILURE; - fuse_hash_value(addr, !yes); + if (fuse_=
hash_value(addr, !yes)) + return CMD_RET_FAILURE; + printf(&quot;Hash key u=
pdated !\n&quot;); return CMD_RET_SUCCESS; -- 2.25.1
</p>
</body>
</html>

--_000_AM0PR06MB61786468730F600995BADBD6B1009AM0PR06MB6178eurp_--

--===============4566999939377311342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4566999939377311342==--
