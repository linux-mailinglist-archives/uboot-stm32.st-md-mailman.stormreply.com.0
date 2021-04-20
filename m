Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D02CE36560A
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Apr 2021 12:21:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86C5EC57195;
	Tue, 20 Apr 2021 10:21:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1484FC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 10:21:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KABQft015078; Tue, 20 Apr 2021 12:21:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=412LTgS3KmidA6e/MkTSLdVXY6JUeESUiYfExGYJKVU=;
 b=CWN9gbEknLp4dJAJZAQc89yFL/MngUbdxRFUfjBfUFW8xPIw92DVdUU13s3cO7NU1F+U
 AF9dQz2jKFYpgbHUscfxsL2cHwijHIhrhAAD4FiOaOsMDZ2tdludLF2HdFMBB651YSOQ
 3yzmhwYdds97Y7ryyi5ZzFNW+SCyKbkU46hMMpJsFCJfHl3CZsAD/T5/w+FI3VykujkX
 9moY1YfEf4H7//sbCmotYG8h5fOnCwtmLnpLSAYY17lHzs7l3vxem25IL3y9QQzAbzNT
 XtxJ0OJjc8001fO0y/C1sw+hBIpgznV8kLxUyLfOoHVKya6BATsMQJ1S+JsRGWPkZxnQ oA== 
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58])
 by mx07-00178001.pphosted.com with ESMTP id 381tg212sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 12:21:15 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgTouY+epljzRDgpILU4dS7RVG5vABFwLcHCoq88ijD+JHbuTke/meniGN8+qqJylHCEYtCGnwl9SUl44ZVF/afOxq9bSePlbLAjquDAIe/grOeMQY09Ba2FfdQcGkptXVb5FLR6KliRzCB+2BGPijgCHa3Mlsj1hYNqzLKUhHQ7MInyrmn2e1OZIZ9yoyWN9YlurWo9BlJILmgbXmSeu/Vn6E0IqIEwkoUN/TANj9wFzn/JenPEnPhWg5VIf5L+QvDiiFvtO4BzYXGL/Il40uCLpgKfbpOR4lKczBKHDrUI+wiAlrrIjAWPB+kqM6rZxMArNDFTDmYq86mTYTbZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=412LTgS3KmidA6e/MkTSLdVXY6JUeESUiYfExGYJKVU=;
 b=c3d65wgB+52afQhAmFK/wDBEns135S2twkXLhTt8nQ15sUQR2EUzDWbwI0MbmLMb4qRfObvVEGCpk/gmbquJVra1orsMET+wFcO8NaYCPf7RArZFlqwDkeErDv2WC0YqRGNKibmIZq0aKt3LBPkd6nlq8RR2/CxCtlId71xaXixZ8+TCqaa2ardIMFfBUCN7ggh7qcHR94LemyLEZJ13vK7OkIzqc850kUd/RyEbdWKHnuUkIl7jD9j2GXufjAk8o1ZNecG8+NbT6ri3OjCDtsZ7cgZwLstSOWb15tKXGeQpeorE5Q/28IO07pg8xfukOPXGePwy0XIq6DPevQ1emw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:102::14)
 by PAXPR10MB4656.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:159::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 10:21:10 +0000
Received: from PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dcea:f7e5:37d5:9d47]) by PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dcea:f7e5:37d5:9d47%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 10:21:10 +0000
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 1/2] cmd: pinmux: update result of do_status
Thread-Index: AQHWrRIQK+yr/C1H/U2Iywzrq9oOPqq+QyQg
Date: Tue, 20 Apr 2021 10:21:10 +0000
Message-ID: <PA4PR10MB4399E6FCFA94A7F85ED8866083489@PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM>
References: <20201028100640.13876-1-patrick.delaunay@st.com>
In-Reply-To: <20201028100640.13876-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.77.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b567e64-70c9-4bde-2986-08d903e604eb
x-ms-traffictypediagnostic: PAXPR10MB4656:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PAXPR10MB4656A61A6247BA3ED9257F6083489@PAXPR10MB4656.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:192;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: esL/ZlIyzMcRZkJr5XZVEwAMmfxmcIcp269QVPQKAa4aiazjotManCmHEBB8xW/D5TetDN10uY2Exr7mhRrn5muRwCtM9bTmnfykLt9L6i2hZuQgaAVkQ9ir6gnuWsotxr62LAifIhFnWNbvZaoqdIiaD3etCGrMttT1FXc1cP4AjIaHIWlTwC4HjaM9ff0Z0duG3WFyx1pZw+RrN7jTxmj6PsG7seu90eLAph6GF8wsdB7bIKYeXAhZrYJvPN8QpVoEUdlnxQPsn2IDC3b2nALM/rzEtVoO6+vLkD7mS2RIjtL/X0y6S9oiOH9AgFLUqx2WwpCnEWGRjJVNZ8Pdr1uy2JNZyeGFb0Heat82Vn1jJC71J5CjjGJ1fkY+oUDuTx8WwiBxO04Mao5dqa6sgBReCMnfkS6y8LvYth7TX7lXlo+M1NOxg2gu78ORxqqJ/CqtL9K1ude2HPpFsVVZxJsB8TgkB+Nnjc+ScHsdn1tlxN9Fogpah2QPNkb5/GGxC99yZc2tMW9UO5Wm8gObtQsxFrZH2k32G0UItnYjMBdBNF3bJU2DC5ZljRaRS9WJ4hCbWO1vfnPxCJMHDtyA7vLU5BWHxSjK6JHF+0oZi9RJuZabeNvWKDKgGEI7uo/mwQ7GQWJetpNOie4uuwfvbkAbmz6THgRBR03y/gokpHRFDnNjFXGli5ZeNknVtFhp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(15650500001)(498600001)(2906002)(4326008)(71200400001)(9686003)(86362001)(122000001)(8936002)(66556008)(76116006)(66476007)(186003)(26005)(966005)(66946007)(55236004)(64756008)(38100700002)(66446008)(7696005)(83380400001)(6506007)(53546011)(54906003)(5660300002)(33656002)(110136005)(8676002)(52536014)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?P+cO9eMXe9jzThrqA31UOO4/qQl7jzFx7X508sC8K2uuPEoBFQ4ABxKJNKwW?=
 =?us-ascii?Q?zxT6XDOBqzznKOxgHkpBk6tyE7lMefqgK+xVZOxDzyIoKfuEa/IDgDIJmVgN?=
 =?us-ascii?Q?BTjhP6mF3D7Sgl65AsaKW9bR+rNFAKgk6DPXU5VY/5zmB5SBrPQ21COoZM3T?=
 =?us-ascii?Q?xbQQj7ZrJ8iB1mmXOKpISC+Wbt1iANyP95bqMmsc3MhFwHbXPvkVCtKWR4d0?=
 =?us-ascii?Q?1hl6ojD285hQ33bXG09ztCM4UbfhwKnz4WXDqoqWpAZsnqiuAC7P1sg+zLxO?=
 =?us-ascii?Q?uv+cZKysp+GkjPXOd7uW2/7skM4FzGB6HYDVD0WkhX0gttzEuk4OMARX2zTv?=
 =?us-ascii?Q?AwjX/ouWwpvcsNEuQ2pF3SBpRwyLY4Vlb87EN6DpVV0P0LHsymg8NbpYotGF?=
 =?us-ascii?Q?AKoEoYHnJnrTaCzeRwWLNhreBbb6IxnJv1KoF2qeMI8fepb7TPCP2+9wYAUO?=
 =?us-ascii?Q?XdsHJeZWZGZ9qlO9mGjAeZJGaGa1FOFFCbJDcVkXG29JYSBy7RCoH46E5u8n?=
 =?us-ascii?Q?QiDMOlMB4FX+dK8Ig3ejnEdV+WBK7L349GyQz93a8HMYCe4WiuazmzKPzRiK?=
 =?us-ascii?Q?G25Cqh9Lvxjr7hxlihL/zFS0kUPN06dNXB+UUbUbqrAW0CrqMmyGRzQxwGw5?=
 =?us-ascii?Q?+97RkSQK+FEAXpT7YXN+Jdfacia6+p9olYvTXOhl5/yQSXh8s6L2jg2raKOT?=
 =?us-ascii?Q?jCKfe//Y7ZOOSYw3WW++mHTcvmwhgjUedXGkdE5T+s09BPLuExQiCkdgkpMe?=
 =?us-ascii?Q?+/aa1UvEl2r39zImm++7DbrUQNOhUnC6ELWN2hgu46KsbAGPYTBUrrztNY/7?=
 =?us-ascii?Q?aW01ST4Z507hTAm+zbLFkLzUVY02Md9FaktYlYGd3OUq/O6x6OYgzpJGchRX?=
 =?us-ascii?Q?pJMpGf031utuVf3l7eRSS9XxaM2zNCG7cyDssy1M12m5r8qyPwb0yEluNkxt?=
 =?us-ascii?Q?B5JW73NpmgQ9KS2gy74YNcJIZkZ9DQ2bJ9mLQNJyinX8tZdwcx83VPLNjudf?=
 =?us-ascii?Q?Ea0dEhSMTqoBBM9SyjMMn/Xio9ZgcpR+2HTOmbcB8/Mte45L4xARGOe1LLKs?=
 =?us-ascii?Q?uhwLH7MDVVk+qIcHPkVBPPaWR7ChFErjlWQMhu9/MNA4XjEEpcsd2dl9BxQh?=
 =?us-ascii?Q?ZWe+q0rU57WyPUZmCe5MExl+VwMeEFyWiIzPQz1rQluzNW6t9C6MtghzB77k?=
 =?us-ascii?Q?qJu0hqfSoiSWg8AZAifOoHRbM7OkH1xNcBsWdGNEOE57Kfv/D6x4kMk2xLnH?=
 =?us-ascii?Q?UVseClfVtsExyxfr/JdfGlSGYaY5ddol8CQ9/wkSVVMbry0XO15J2Jv2Lw5s?=
 =?us-ascii?Q?Oj4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b567e64-70c9-4bde-2986-08d903e604eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 10:21:10.8024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EDs3JaJiEDS89jz6GxIU94SNEBpay7XcLukFPN29QbRyapp4UpeC/ha87L1iC1ZijOKbmUq01TT79NaRAjBE3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB4656
X-Proofpoint-GUID: bEmdjyHw_DJTnEaWoRPvoL8IPtCbQYm8
X-Proofpoint-ORIG-GUID: bEmdjyHw_DJTnEaWoRPvoL8IPtCbQYm8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_02:2021-04-19,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0
 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200078
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] cmd: pinmux: update result of
	do_status
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

Hi Patrick

-----Original Message-----
From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On Behalf Of Patrick DELAUNAY
Sent: mercredi 28 octobre 2020 11:07
To: u-boot@lists.denx.de
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>; Simon Glass <sjg@chromium.org>; Patrick DELAUNAY <patrick.delaunay@st.com>; Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/2] cmd: pinmux: update result of do_status

Update the result of do_status and alway returns a CMD_RET_ value (-ENOSYS was a possible result of show_pinmux).

This patch also adds pincontrol name in error messages (dev->name) and treats correctly the status sub command when pin-controller device is not selected.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/pinmux.c                 | 44 +++++++++++++++++++-----------------
 test/py/tests/test_pinmux.py |  4 ++--
 2 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/cmd/pinmux.c b/cmd/pinmux.c index 9942b15419..af04c95a46 100644
--- a/cmd/pinmux.c
+++ b/cmd/pinmux.c
@@ -41,7 +41,7 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
-static int show_pinmux(struct udevice *dev)
+static void show_pinmux(struct udevice *dev)
 {
 	char pin_name[PINNAME_SIZE];
 	char pin_mux[PINMUX_SIZE];
@@ -51,54 +51,56 @@ static int show_pinmux(struct udevice *dev)
 
 	pins_count = pinctrl_get_pins_count(dev);
 
-	if (pins_count == -ENOSYS) {
-		printf("Ops get_pins_count not supported\n");
-		return pins_count;
+	if (pins_count < 0) {
+		printf("Ops get_pins_count not supported by %s\n", dev->name);
+		return;
 	}
 
 	for (i = 0; i < pins_count; i++) {
 		ret = pinctrl_get_pin_name(dev, i, pin_name, PINNAME_SIZE);
-		if (ret == -ENOSYS) {
-			printf("Ops get_pin_name not supported\n");
-			return ret;
+		if (ret) {
+			printf("Ops get_pin_name error (%d) by %s\n",
+			       ret, dev->name);
+			return;
 		}
 
 		ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
 		if (ret) {
-			printf("Ops get_pin_muxing error (%d)\n", ret);
-			return ret;
+			printf("Ops get_pin_muxing error (%d) by %s in %s\n",
+			       ret, pin_name, dev->name);
+			return;
 		}
 
 		printf("%-*s: %-*s\n", PINNAME_SIZE, pin_name,
 		       PINMUX_SIZE, pin_mux);
 	}
-
-	return 0;
 }
 
 static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
 		     char *const argv[])
 {
 	struct udevice *dev;
-	int ret = CMD_RET_USAGE;
 
-	if (currdev && (argc < 2 || strcmp(argv[1], "-a")))
-		return show_pinmux(currdev);
+	if (argc < 2) {
+		if (!currdev) {
+			printf("pin-controller device not selected\n");
+			return CMD_RET_FAILURE;
+		}
+		show_pinmux(currdev);
+		return CMD_RET_SUCCESS;
+	}
 
-	if (argc < 2 || strcmp(argv[1], "-a"))
-		return ret;
+	if (strcmp(argv[1], "-a"))
+		return CMD_RET_USAGE;
 
 	uclass_foreach_dev_probe(UCLASS_PINCTRL, dev) {
 		/* insert a separator between each pin-controller display */
 		printf("--------------------------\n");
 		printf("%s:\n", dev->name);
-		ret = show_pinmux(dev);
-		if (ret < 0)
-			printf("Can't display pin muxing for %s\n",
-			       dev->name);
+		show_pinmux(dev);
 	}
 
-	return ret;
+	return CMD_RET_SUCCESS;
 }
 
 static int do_list(struct cmd_tbl *cmdtp, int flag, int argc, diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py index 0cbbae000c..b3ae2ab024 100644
--- a/test/py/tests/test_pinmux.py
+++ b/test/py/tests/test_pinmux.py
@@ -13,9 +13,9 @@ def test_pinmux_usage_1(u_boot_console):
 @pytest.mark.buildconfigspec('cmd_pinmux')
 def test_pinmux_usage_2(u_boot_console):
     """Test that 'pinmux status' executed without previous "pinmux dev"
-    command displays pinmux usage."""
+    command displays error message."""
     output = u_boot_console.run_command('pinmux status')
-    assert 'Usage:' in output
+    assert 'pin-controller device not selected' in output
 
 @pytest.mark.buildconfigspec('cmd_pinmux')
 @pytest.mark.boardspec('sandbox')

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
--
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
