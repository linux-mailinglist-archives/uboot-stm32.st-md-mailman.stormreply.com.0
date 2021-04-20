Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC03D36560C
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Apr 2021 12:22:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0E9CC57196;
	Tue, 20 Apr 2021 10:22:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DE1AC3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 10:22:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KALRJK002461; Tue, 20 Apr 2021 12:22:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GQnt2TMRLUyo68skv+asLtFlcoyrzx7IZLEyVpjLnJo=;
 b=eKOxWZ8e0Q1mpOGqoyJEHu6DA/GJtpHKifGClpw50Y64br7RmSEp+DQQSaX/pfrVNmAm
 07E3PM0QoA0s/YXVwl4BXD7lzxP9Nz8ncS43FoJdeLGIMyeOs3Dmw49QAeaJ9jXzXjLO
 Q5sWOf2ng4TKEDaIh24j9OunlwBFLI/E4VdwZYKHG0NO/9FdV5DNrET7lL8YkpFDdgbP
 TQQj8DV+3fKWGeHZK8pMNBUKG+GOgu/oD0HRVx3OiyGKuzYlgwuEeFzyKozU6HEb+ITb
 2oOm4l7HhOgHXYsO/k0lUMY1uBRbk7Jg9pEkz+z/WktVwSzh1lI/nQPQ9sAnnpW3RnR2 rw== 
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
 by mx07-00178001.pphosted.com with ESMTP id 381tg212vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 12:22:00 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oawAIDoD9aGTk1984GWB2WVQ1/ZQO/loBvIZtsjhT552fY+YSYL5r+xJpz+NCeB4cOLkociP4DgDilZJBN7mkOhhr1FCv1U8lPEFfED2v/YSGp11bLObirDuV3jqHvn+I6Dw7DgFQOdo3efu6yLbc9Hsu8wnQPZM988TntXL/XTzoAN4A3MIfyiOXMcgNrSv/4e3i3ydyVrIVwGULCcH+7XldmFAAk7ZhP7pOZ3qcCtBJUMt04e0sv7pwSjBawnglgwtgH/vQ7hHsdydG9sd+RyJyNj156XgYACwNH7cc56C4OvAqAMff8gLI4bOgleWZOZKqwh4JUcslUAnZqv+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQnt2TMRLUyo68skv+asLtFlcoyrzx7IZLEyVpjLnJo=;
 b=RjVVS2zpvUMYdhDhGvMAvfnb/DTRbm7qfaKe+KikPVpR3j2N6UB/rLi142f88pZ6Fcq9ZTFTvRuQHxwsE0S4JyJ9XEeUrgqkFo0vaTnaJRzBlQlxUssZTaAa35o64UnVNrZVbRhJsZoEXF0io0QmGaEYhFplSucLbueLkCkoR5EzCvXBmvfuSEoCQDU5EY8VqyMaxijKAEtVv5HQ/B9SM/7YZsDN9W3KRfrG1Q5eQEMKYdm45V7yxlDSlC8lnIFtELaTrBU5DPBLaEqBmQKHykpQmjbS/PaYjZAdfcqImc3VDJbRPBai3NTQHB5C7LDTKzZn9xrWBHbS5sNjBZeW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:102::14)
 by PR3PR10MB4128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 10:21:59 +0000
Received: from PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dcea:f7e5:37d5:9d47]) by PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dcea:f7e5:37d5:9d47%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 10:21:59 +0000
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/2] cmd: pinmux: support pin name in
 status	command
Thread-Index: AQHWrRIP1h92qg+zX0+u4bT8XtA6qaq+Q7WA
Date: Tue, 20 Apr 2021 10:21:59 +0000
Message-ID: <PA4PR10MB4399AEB02B328E2265EF03F483489@PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM>
References: <20201028100640.13876-1-patrick.delaunay@st.com>
 <20201028100640.13876-2-patrick.delaunay@st.com>
In-Reply-To: <20201028100640.13876-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.77.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15c29221-0395-493c-a9f6-08d903e621b9
x-ms-traffictypediagnostic: PR3PR10MB4128:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PR3PR10MB41280E54DCD14BA9CF84E62D83489@PR3PR10MB4128.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:72;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zeZgypv0HEYKMT2KZqsjspypMGxqKSaUCXVXUu5NqcEhjNhJuxVX6QVU87e2iD5in/J4EWgyjt9VS+G+P75xr92Uv6wR0+7KUwOlTKW1cRiX3JhlcWYm5S86S3EEJysEzaNLUUoinf7u0xsCwWOj0chyxuCOZg96eu2M2KRjEFmfEmJF7k7sjtY+XlZsM3F1VN3uIRXPvw28oTK74ww71jgrpXuYHKwLJ6LCVa6jayIfCj6WLW67NTLRKP4mNBCTdiBcYOqNoPfhPuQJrKjzKzAyPn8YVDpAsuZzBBSmBKRMO/r7lAzcUDLZBEyX2feq61+4p43VD71I0BxgjB9nbK/JIMEi8AkPvpFbL9BMYt9iD8anTfQHE9xWnUDT3t8GrkQw+1GGiamqdFLZqw5CFuYV1RzeV8ot4VEPGPB/6gs6qnhzQEauahhzdbnZZYaXxWaKyfYUoG+PtfKpvGCX8ZPFrgLcgRUeouA8OoCXgv2NInzENpHLrtLBtIz6pdGJcz6NWjA8SLhjwApTRAwnNFwVtp9SiDC03CX5pV/gfZ7BGmwk1nddSgS/7y7xV6vdwik2pBSU/O7cJn3mHcEAXdlNuwS4UFssKJSRkNgQ3CMf+FaI9ARRu3rOgY+nol5ShFDtdt5ymrst4Tt/g8JikHFJ9WW1ROvUowkSgXvol6jxqwWwRug5y6UcaoS0iuaC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(33656002)(64756008)(38100700002)(54906003)(83380400001)(53546011)(8936002)(186003)(5660300002)(966005)(122000001)(6506007)(66446008)(110136005)(66556008)(52536014)(86362001)(55236004)(76116006)(4326008)(9686003)(66946007)(66476007)(71200400001)(2906002)(498600001)(7696005)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PtSNczBR+Q+2fAAf9xNUFtfJAFgJ+6cE39Y9st7dD+D47gwKtzAk00F/b652?=
 =?us-ascii?Q?gax2MJh/whYWAvMVv3eGpgo9/cDPmGCHSv+8iFF8QOij9K8gmubD8EgoxIXi?=
 =?us-ascii?Q?wwLVNq3ct5xNMO+T7pYZ2g4w4ss/THCiGfRo5fwdY0BskngtEs3ufocIyyHB?=
 =?us-ascii?Q?JGqjqKxMeJqdKmMpnj861I+ifZ7pR+WQm6ghSpoKT7r/dTDv0bZ26VVmobHT?=
 =?us-ascii?Q?G+95MQkD/yRfb5rLMBrSboMJTRni1xAvqYdqPbETL3GspiUJ/+tF+OvHPw3r?=
 =?us-ascii?Q?O07OqeYJ/iH/0ylH0vbFK3Mb9fJOsrQFpSLeZpb9EXmH0NGkc4SLBqoy9zoo?=
 =?us-ascii?Q?KtcJqlu4pBMkhHL3hLkeglwuVv8yhfl38Pr9ZaR+6yO0v039stE6m+HEaeqD?=
 =?us-ascii?Q?Q/c2gTdfEYCNNj+JU5L2loidf90GDLi/T2JNSJoPgR7IYyV4f5n0IIRp74oM?=
 =?us-ascii?Q?EKcRCQgA6Hv4+EaFGP+9ptQJ6kpIRTMvUdLZji6sBtvfVSDTur8nKZ8baDoB?=
 =?us-ascii?Q?IaiWrOq8+AoL7RPOvT5PI31b6oZtTjzz1LAChhmgxu+skkrCT1Hpp6Vq79YI?=
 =?us-ascii?Q?G0eKMoCxegsLKYpHM/krAvVTH0Kef835o95oMvDXAwwjutsic/jh3G0abnpZ?=
 =?us-ascii?Q?HcQIDqM/VXhxqzZAcl4HzqiwHbpCDlisVPLvK7VL10BfrUIVjzFX6vbG+CyK?=
 =?us-ascii?Q?oeaV2/QqqlxLELuH2/VqMkTMcE6oRyUre3TXQeMUkwmlOMNHJjaksM7Y6gX5?=
 =?us-ascii?Q?pVz9flwSsCm8kPNi8rPjkShJ+5TlGGJq6VaN8+AjluZXcE1w9UOa41s45JU1?=
 =?us-ascii?Q?mqX5Q2g19YxfEcPngAt8xEsNRHGp4GOdXqtUxEyEXUIAU+xFPMiyzdRN8W+X?=
 =?us-ascii?Q?ZumTLY6Z0HDAXG1aTPFfThS5L6FfKbmWMD0Bk5o6FZaplKpHFEMg8l9Tdzdo?=
 =?us-ascii?Q?fXkluB3M/64ge8vYCwJM6q7S6OBgA8cLuqWYPijeSYf/8qEn8l7T1B55uZ5O?=
 =?us-ascii?Q?xhMe4mHquVQZ9C7Yx12tPC1srU0VTWw9O+aV38e1q8PvsXGA+WoP37w3Lv0F?=
 =?us-ascii?Q?RMEWCry6a87Q1YPNx+a0d2SpI+LNqA/iJbMsfozBOA8AHwTrs0cyLjulHJIJ?=
 =?us-ascii?Q?Uh+1qtrSEyvfyBWUpYIgzTaym8jcBjZRgGgOm78niOWbbz5yGdAERS4zdotZ?=
 =?us-ascii?Q?K2Ct0gv0NcanySjA8214XOFdT8P3cgb8OCNe0WgIkV3nLe5EVsStswtxJuqe?=
 =?us-ascii?Q?5teLNPsMr8oNdTRmziwXc1gxgsiy/pQRjmruyoVlU0AJClXauloKUzQEuk1S?=
 =?us-ascii?Q?k5OPiy+HISqEGm2HAz13dMnC?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c29221-0395-493c-a9f6-08d903e621b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 10:21:59.2355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lpEBTSqdE8KqbuUP85Xk8GIC+6jauFwEPEuQPCKUxZ6zdZLC0F+1SGLjfBw/YU2D/loDMQsrbrEHu6iZj7zaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4128
X-Proofpoint-GUID: 2zn2Y7UAsHS83GnysGA9VuXWJQSYQL2l
X-Proofpoint-ORIG-GUID: 2zn2Y7UAsHS83GnysGA9VuXWJQSYQL2l
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_02:2021-04-19,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200079
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] cmd: pinmux: support pin name in
	status	command
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
Subject: [Uboot-stm32] [PATCH 2/2] cmd: pinmux: support pin name in status command

Allow pin name parameter for pimux staus command, as gpio command to get status of one pin.

The possible usage of the command is:

> pinmux dev pinctrl
> pinmux status

> pinmux status -a

> pinmux status <pin-name>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/pinmux.c                 | 41 +++++++++++++++++++++++++-----------
 test/py/tests/test_pinmux.py | 29 +++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 12 deletions(-)

diff --git a/cmd/pinmux.c b/cmd/pinmux.c index af04c95a46..e096f16982 100644
--- a/cmd/pinmux.c
+++ b/cmd/pinmux.c
@@ -41,19 +41,20 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
 	return CMD_RET_SUCCESS;
 }
 
-static void show_pinmux(struct udevice *dev)
+static bool show_pinmux(struct udevice *dev, char *name)
 {
 	char pin_name[PINNAME_SIZE];
 	char pin_mux[PINMUX_SIZE];
 	int pins_count;
 	int i;
 	int ret;
+	bool found = false;
 
 	pins_count = pinctrl_get_pins_count(dev);
 
 	if (pins_count < 0) {
 		printf("Ops get_pins_count not supported by %s\n", dev->name);
-		return;
+		return found;
 	}
 
 	for (i = 0; i < pins_count; i++) {
@@ -61,43 +62,59 @@ static void show_pinmux(struct udevice *dev)
 		if (ret) {
 			printf("Ops get_pin_name error (%d) by %s\n",
 			       ret, dev->name);
-			return;
+			return found;
 		}
-
+		if (name && strcmp(name, pin_name))
+			continue;
+		found = true;
 		ret = pinctrl_get_pin_muxing(dev, i, pin_mux, PINMUX_SIZE);
 		if (ret) {
 			printf("Ops get_pin_muxing error (%d) by %s in %s\n",
 			       ret, pin_name, dev->name);
-			return;
+			return found;
 		}
 
 		printf("%-*s: %-*s\n", PINNAME_SIZE, pin_name,
 		       PINMUX_SIZE, pin_mux);
 	}
+
+	return found;
 }
 
 static int do_status(struct cmd_tbl *cmdtp, int flag, int argc,
 		     char *const argv[])
 {
 	struct udevice *dev;
+	char *name;
+	bool found = false;
 
 	if (argc < 2) {
 		if (!currdev) {
 			printf("pin-controller device not selected\n");
 			return CMD_RET_FAILURE;
 		}
-		show_pinmux(currdev);
+		show_pinmux(currdev, NULL);
 		return CMD_RET_SUCCESS;
 	}
 
 	if (strcmp(argv[1], "-a"))
-		return CMD_RET_USAGE;
+		name = argv[1];
+	else
+		name = NULL;
 
 	uclass_foreach_dev_probe(UCLASS_PINCTRL, dev) {
-		/* insert a separator between each pin-controller display */
-		printf("--------------------------\n");
-		printf("%s:\n", dev->name);
-		show_pinmux(dev);
+		if (!name) {
+			/* insert a separator between each pin-controller display */
+			printf("--------------------------\n");
+			printf("%s:\n", dev->name);
+		}
+		if (show_pinmux(dev, name))
+			found = true;
+	}
+
+	if (name && !found) {
+		printf("%s not found\n", name);
+		return CMD_RET_FAILURE;
 	}
 
 	return CMD_RET_SUCCESS;
@@ -148,5 +165,5 @@ U_BOOT_CMD(pinmux, CONFIG_SYS_MAXARGS, 1, do_pinmux,
 	   "show pin-controller muxing",
 	   "list                     - list UCLASS_PINCTRL devices\n"
 	   "pinmux dev [pincontroller-name] - select pin-controller device\n"
-	   "pinmux status [-a]              - print pin-controller muxing [for all]\n"
+	   "pinmux status [-a | pin-name]   - print pin-controller muxing [for all | for pin-name]\n"
 )
diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py index b3ae2ab024..fbde1d99b1 100644
--- a/test/py/tests/test_pinmux.py
+++ b/test/py/tests/test_pinmux.py
@@ -82,3 +82,32 @@ def test_pinmux_status(u_boot_console):
     assert ('P6        : GPIO1 drive-open-drain.' in output)
     assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
     assert ('P8        : GPIO3 bias-disable.' in output)
+
+@pytest.mark.buildconfigspec('cmd_pinmux')
+@pytest.mark.boardspec('sandbox')
+def test_pinmux_status_pinname(u_boot_console):
+    """Test that 'pinmux status <pinname>' displays selected pin."""
+
+    output = u_boot_console.run_command('pinmux status a5')
+    assert ('a5        : gpio output .' in output)
+    assert (not 'pinctrl-gpio:' in output)
+    assert (not 'pinctrl:' in output)
+    assert (not 'a6' in output)
+    assert (not 'P0' in output)
+    assert (not 'P8' in output)
+
+    output = u_boot_console.run_command('pinmux status P7')
+    assert (not 'pinctrl-gpio:' in output)
+    assert (not 'pinctrl:' in output)
+    assert (not 'a5' in output)
+    assert (not 'P0' in output)
+    assert (not 'P6' in output)
+    assert ('P7        : GPIO2 bias-pull-down input-enable.' in output)
+    assert (not 'P8' in output)
+
+    output = u_boot_console.run_command('pinmux status P9')
+    assert (not 'pinctrl-gpio:' in output)
+    assert (not 'pinctrl:' in output)
+    assert (not 'a5' in output)
+    assert (not 'P8' in output)
+    assert ('P9 not found' in output)


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
