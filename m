Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E08FE3B9449
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 17:49:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26CE8C59781;
	Thu,  1 Jul 2021 15:49:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2135.outbound.protection.outlook.com [40.107.20.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 274E1C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 15:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnmBrt7ZXxQyRTn2XgGhuMXDCxTkoCmGi0ZM4u8/FlIihyxZJdvE4YjYFhkewSrLYyUcyk2pLE2LpiHItL/uLUmp2HdzpKSBcRoSxUATD2JAuh7bkWKDreR9cnqwwuatI0vqAbG7nh7pXwGEKI7kiP2hQPPD6Lih9Zq1S+doM2/mSDNLU3bYf7fjzuro8bgPL0l+H5EFmQUdOKkr7PjWO+Q+3o4FjV+yXnqMkf0g2fKK+3UhSMf7wkQFzBDayCNA+VqG7a+jXDPD2M6XN/53ZhNkJlqkg95z/ZBtgKgk5uij9ZSXU/c2rp/AKvLmNp+oj8wJLZcMa0Pr9iBDCaTCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMcFDcK0pOoDI2ayHkFR0cJ8hgmR6tAPvDF7AZ/lo7M=;
 b=agWtQrpWxTLEGp8tAOogMmYnvirOs5D4Wreh4xZiyUgzddyY6/lkQ+albSVm35hDy4P/wR5DLvRh2Z2iceRDrynMfdrYFAd9gyKrdGF+smSaw6jSc2sHjZFJq7tDuCe+HJ0Q8xzI+hOd9AKFRgQkpgrw+r3WwJze0mRMEpB0XLJ+a+UEBXpHk9vYQNz67zrwoQ0GH+ci34NMRmlCXcOEzRdgMME2del8xkCxXD1iYbWnFCX0jcw9mDuXTZ7wepVxhWNW686YmavZsRlfPA6BdMrqVwGWoJvzEtLM6swx+louH0/8wUMcU9PMaIUkrt2s8OZxL1tAe1jfimhyGwoBtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hexagon.com; dmarc=pass action=none header.from=hexagon.com;
 dkim=pass header.d=hexagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hexagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMcFDcK0pOoDI2ayHkFR0cJ8hgmR6tAPvDF7AZ/lo7M=;
 b=mUPnVXZ3SufkmD3dxBvd2EldhCLbVZYbhhxcmKxFPS6S5UgL6pIOX+P+AX0l53OQc/22vQ29mavJmdkr5bfy7WDa9yYGjk4Jk59d68RBNETZYdv1+30eCov6QkrwcJW+NOU/8XYLH7ppvNCuthFNxMJOEmwMgAgsFDlRyjDzIBg=
Received: from VI1PR06MB4206.eurprd06.prod.outlook.com (2603:10a6:803:6b::18)
 by VI1PR0602MB3389.eurprd06.prod.outlook.com (2603:10a6:803:9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 15:49:24 +0000
Received: from VI1PR06MB4206.eurprd06.prod.outlook.com
 ([fe80::306a:b138:4d2e:339]) by VI1PR06MB4206.eurprd06.prod.outlook.com
 ([fe80::306a:b138:4d2e:339%5]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 15:49:24 +0000
From: Hexagon Email Recovery <email-recovery6@hexagon.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 5/7] stm32mp: cmd_stm32key: add get_misc_dev function
Thread-Index: AQHXbpCqmx514rT8bEe5D4SJ9YBoJw==
Date: Thu, 1 Jul 2021 15:49:24 +0000
Message-ID: <VI1PR06MB4206C46BB3B5ECF42E299742B3009@VI1PR06MB4206.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-mail-application: Microsoft Power Automate; User-Agent:
 azure-logic-apps/1.0 (workflow 033cf894dba94d788dd6b27272e2ee33; version
 08585764530944536548) microsoft-flow/1.0
x-ms-mail-operation-type: Send
x-ms-mail-environment-id: default-1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=hexagon.com;
x-originating-ip: [94.245.91.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ada8b90c-ce81-4a0b-02de-08d93ca7ccbf
x-ms-traffictypediagnostic: VI1PR0602MB3389:
x-microsoft-antispam-prvs: <VI1PR0602MB3389DA283AC0E347C8D76E5FB3009@VI1PR0602MB3389.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4RVimS0Aw3rM46jmuaLJVukb5oJN4Smg2gw0UX/wq6qombZH/OCdq7pfDIGviq2/CUI5V7qIvWGTWMbp1aoPtlFQ8DqDFWbUshudwmhV0TEiiiAnOadeZUmtDlnwz4b8N49I/m/FOwVxWH7inUimyoBasx65TFag7YyOiW+WPvr6GoN010Mpz/6el3jCkwhSzcg/9V26v5+h2kwkdw0HBxSrYpqhDwTvehsua20t96T/6V4/rJ0eF41SUwGVhynMvoWDHeFUH77wPRZ5nCne8X/yA/q/I83T6l7nsYnICZ32p9FAd6ARmsuh0MS+WnkQj75mts542ntXSPOgzvUaoAgMZwUYuPB53QU2Q+x+ZI2XDT7Ne6mhN9tRmD/Ucmmm5hY8/N5wCvzX6+nmALtaNb3LIoXJMCRMnQA/znMohS9wMnmDe/3mPVKQY/H9Offzp08YFPVocH4651KqQ0tervGzN4IL0dkQf1e/9FfeU6RNxFbRxp+dCZ4ABELK2NC981pB7M+NYRwH4HY+ygV1y8UNnm/177jY/AIsHPsm8m0HrW7jUiONZZLlwK6IBgXohauJwyi+c8N4MeiJnna6mK8JzKfQNmVNP+tNIVEhXC96yyanQZDlh7QfTj9Be5WnfpPlGuW3QUt8EYsHRymNLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB4206.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(2906002)(9686003)(55016002)(38100700002)(122000001)(86362001)(6506007)(4326008)(66946007)(6916009)(478600001)(64756008)(26005)(71200400001)(66476007)(66556008)(45080400002)(52536014)(91956017)(8936002)(76116006)(66446008)(7696005)(186003)(316002)(33656002)(5660300002)(8676002)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Sk+klWKuhBrpFtxYkDNH3iA0zedgjViFOD7vpGXMPgXJbZno8Ol9jseK?=
 =?Windows-1252?Q?fAfv6+wHDF9XQx9GVo+0qHGpRQas1MGom1i0moXxWOrtQb9ZxYOIGL0S?=
 =?Windows-1252?Q?eNfXHOAatB7TS4QNqD7ZIJ7/oTy0UkPowI/1xYrHSxQsJ6mMXCPydlzs?=
 =?Windows-1252?Q?vpc2Es2VBoZhRe51snc6TucjxGS8vvHLnze++t/CaiwVhI9WPZw3WERJ?=
 =?Windows-1252?Q?CxAC/FMKt6GD8jwsZiyJPy4ldRPVi2zAsYkuwc/whRD6Se6+Nz6gnPPK?=
 =?Windows-1252?Q?n/JXJc4zp2qCAhOWZ8lAgPi/xsG8EEaZFDWsC3LUMB53eOPDCMluplN/?=
 =?Windows-1252?Q?7QLzYR5Kg1wFbnmcLcsD0deXWR0H4r4313CyooOsagtwdIlbIt27zEuy?=
 =?Windows-1252?Q?eqT/YUgi0LUUxIxWDLj5qJcc+6P43QZUJhB/u03sHxkFpK1rU07AnGEu?=
 =?Windows-1252?Q?AWOWmSRV8zuTaSei51zVeZW2IEHqyJkuQ/i7myXu3S+nYQi2oydVs7X4?=
 =?Windows-1252?Q?kBbCszrpgVnxwnQssF+gHTsOXmffNh/hBGQxMwpBd/Pu3rhcyusO4Uku?=
 =?Windows-1252?Q?gaWyS1v7/2NLQhhyIJueEMAF1DAsz1YkHcrnvBQrh1wLriZf6C8nOqRI?=
 =?Windows-1252?Q?YhhuS9tx8SGx7XmaDJ1e1SYKNmOI6ArUM6g754rbNBisKPL3+TIeCIDI?=
 =?Windows-1252?Q?NY/TeZCGO4tqMazjhSr6iz87TQmfREFx81SnVqC86aAWxyvLd4stPsS9?=
 =?Windows-1252?Q?QsNfUMzIVoYjnElKnwuHuaYQWcqfRybat7dFjuIipi5bDjvLyinG7nys?=
 =?Windows-1252?Q?TZCvaiVn6BpZWuuxaeXSvSHfgr1Cuosktmp/2CfDv/FTbY0jMIm3ATlW?=
 =?Windows-1252?Q?LhLEGNzQ9aewfgr7VUD+FV5sTpP+wKz9wHA/NKkZHpXbbfA7qpr17iqU?=
 =?Windows-1252?Q?BVjJPcqGmuEeCm/+r0WWyFOFXc1RPh7K6Epc3fEH1K+QMnfjYdaeS8/V?=
 =?Windows-1252?Q?9M1myOfM+aho0AvwUrnXDb4wzi5oiAKPNR8zoLgc7g/fALeX0d4AWsQG?=
 =?Windows-1252?Q?MKT9eEXgAFiSlPB9IvZogvIGVxDFW5K5rqtsq+2/P3bCcMpm9/7CaJfr?=
 =?Windows-1252?Q?49zFy5EG6KJAQqWG2zP/pb7xq4Zk67NdT40sZLksALrO17CaycptFUCY?=
 =?Windows-1252?Q?lWaBrYQ/eYBzKP4rpGIz7BT/3L2uvYRAequtfzl353ltBb4dx9x4rhfo?=
 =?Windows-1252?Q?Yj1epUaEyB5z937vnHONEMtEOmw9G45MAqz9uOb2mStAdk833qkpIbMP?=
 =?Windows-1252?Q?E3h7xLtMbAT+vs0ZH3ZowdYFyxZ5nqPaIaPSRH5Zk4mhVzC+Tei8omKN?=
 =?Windows-1252?Q?JV3xT4Ih4/yJvJx9aazmTAq0xRdsRYV/fsh29TsGjTWlI+HRJGKWPIcu?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hexagon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB4206.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada8b90c-ce81-4a0b-02de-08d93ca7ccbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 15:49:24.0911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpM7p0kM1JqoXheycKM9WzHG681RUvIak2Ap9ncg/pwVaZQNemi6oi6VKppXrzcYHhV/uLDtq63hzHq6QONj2qLsOpZGNdxRrE4Ww9Kxr64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3389
Cc: "patrick.delaunay@foss.st.com" <patrick.delaunay@foss.st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 5/7] stm32mp: cmd_stm32key: add get_misc_dev
	function
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
Content-Type: multipart/mixed; boundary="===============1347594908461832762=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1347594908461832762==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR06MB4206C46BB3B5ECF42E299742B3009VI1PR06MB4206eurp_"

--_000_VI1PR06MB4206C46BB3B5ECF42E299742B3009VI1PR06MB4206eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This message could not be delivered immediately due to an internal mail rou=
ting issue.
The mail routing error has been resolved in the meantime.
We apologize for the delay in delivery and any inconvenience this may have =
caused.
In case of any questions please contact us via it@hexagon.com.

Original sender: patrick.delaunay@foss.st.com
Original delivery time: 28-Jun-2021 01:34 PM (UTC)
---------------------------------------------------------------------------=
--------------------------------------------
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Add a =
helper function to access to BSEC misc driver. Signed-off-by: Patrick Delau=
nay --- arch/arm/mach-stm32mp/cmd_stm32key.c | 19 +++++++++++++------ 1 fil=
e changed, 13 insertions(+), 6 deletions(-) diff --git a/arch/arm/mach-stm3=
2mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c index c4cb6342fa.=
.886c52794f 100644 --- a/arch/arm/mach-stm32mp/cmd_stm32key.c +++ b/arch/ar=
m/mach-stm32mp/cmd_stm32key.c @@ -14,6 +14,17 @@ #define STM32_OTP_HASH_KEY=
_START 24 #define STM32_OTP_HASH_KEY_SIZE 8 +static int get_misc_dev(struct=
 udevice **dev) +{ + int ret; + + ret =3D uclass_get_device_by_driver(UCLAS=
S_MISC, DM_DRIVER_GET(stm32mp_bsec), dev); + if (ret) + log_err("Can't find=
 stm32mp_bsec driver\n"); + + return ret; +} + static void read_hash_value(=
u32 addr) { int i; @@ -31,13 +42,9 @@ static int fuse_hash_value(u32 addr, =
bool print) u32 word, val; int i, ret; - ret =3D uclass_get_device_by_drive=
r(UCLASS_MISC, - DM_DRIVER_GET(stm32mp_bsec), - &dev); - if (ret) { - log_e=
rr("Can't find stm32mp_bsec driver\n"); + ret =3D get_misc_dev(&dev); + if =
(ret) return ret; - } for (i =3D 0, word =3D STM32_OTP_HASH_KEY_START; i < =
STM32_OTP_HASH_KEY_SIZE; -- 2.25.1

--_000_VI1PR06MB4206C46BB3B5ECF42E299742B3009VI1PR06MB4206eurp_
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
Original delivery time: 28-Jun-2021 01:34 PM (UTC)<br>
---------------------------------------------------------------------------=
--------------------------------------------<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email. Add a =
helper function to access to BSEC misc driver. Signed-off-by: Patrick Delau=
nay
<patrick.delaunay@foss.st.com>--- arch/arm/mach-stm32mp/cmd_stm32key.c | 19=
 +++++++++++++------ 1 file changed, 13 insertions(+), 6 deletions(-) diff =
--git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_st=
m32key.c index c4cb6342fa..886c52794f
 100644 --- a/arch/arm/mach-stm32mp/cmd_stm32key.c +++ b/arch/arm/mach-stm3=
2mp/cmd_stm32key.c @@ -14,6 +14,17 @@ #define STM32_OTP_HASH_KEY_START 24 #=
define STM32_OTP_HASH_KEY_SIZE 8 +static int get_misc_dev(struct udevice **=
dev) +{ + int ret; + + ret =3D uclass_get_device_by_driver(UCLASS_MISC,
 DM_DRIVER_GET(stm32mp_bsec), dev); + if (ret) + log_err(&quot;Can't find s=
tm32mp_bsec driver\n&quot;); + + return ret; +} + static void read_hash_val=
ue(u32 addr) { int i; @@ -31,13 +42,9 @@ static int fuse_hash_value(u32 add=
r, bool print) u32 word, val; int i, ret;
 - ret =3D uclass_get_device_by_driver(UCLASS_MISC, - DM_DRIVER_GET(stm32mp=
_bsec), - &amp;dev); - if (ret) { - log_err(&quot;Can't find stm32mp_bsec d=
river\n&quot;); + ret =3D get_misc_dev(&amp;dev); + if (ret) return ret; - =
} for (i =3D 0, word =3D STM32_OTP_HASH_KEY_START; i &lt; STM32_OTP_HASH_KE=
Y_SIZE;
 -- 2.25.1 </p>
</body>
</html>

--_000_VI1PR06MB4206C46BB3B5ECF42E299742B3009VI1PR06MB4206eurp_--

--===============1347594908461832762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1347594908461832762==--
