Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D87BC9706
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 16:09:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 672E0C555B5;
	Thu,  9 Oct 2025 14:09:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E89C6C555B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 14:09:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599DLL78000974;
 Thu, 9 Oct 2025 16:09:06 +0200
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6h4asd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 16:09:06 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWh3hGuXdoU7OoszITlmjl/m674ceTOYDxwaNldILaEpWRDcpT8po3Q24EuWF4Hum11atpThdVg8Y3s/+0h/OF0M067PJq1Z4M+y4+ToeNbm0+Waa/3Qe3ZTII9ZnoamoVMnTdjxx/q6TVuFKf5aOIDR2EfLqvC1y5NVc6Z91GgyOO3q4tXem38uThbIeQ5pc4htLd+UoO8vAbEO4pIcCDP9TBCPf/gihgxf9EJGAb8IxG/x8+xlIGEplnlHla3mA+aDokcaslsDB0/V2H/P18aDitOlBEV0dlXqLJF/dG5MYRdtdsL0A0/e1NWyR8GcLFkNFxI4RGwM8qtkAbQELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+XtzXLE0G6c3ftawFLQVffsYg7BKcgNLCRBEyirxe0=;
 b=UZaF7A3CirtKvQQqkuTMnxl2tAOm9bKa0qk8mAIPtGiGWwU3+4btExFQdP2v430dnRvs1I+xvP4mTOx37Kib70ZMwDceHtfnsczDUXQSEGUOXjGw454jllPVGd1vKaxW45rWp4e65CubEGoT6qmoUQjs2JDXgzvkhMjw3qfhmZGsCRvzPf/fvYLdVB57hIqD/sGrOAstbFcJaNZ+TqgdkqkbGhCJXM0Qq3iLESeGzNymxXDn22tnGKZPCCIp1seZPVHcvI29T0O6kuXvCFFzuu5DsmbEt2GGIrcRjJP50UvZj26Czw1vW7l+R2vqR2DCmVwLQ2h6a6lVSe1hf5+w0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+XtzXLE0G6c3ftawFLQVffsYg7BKcgNLCRBEyirxe0=;
 b=CTtH2+pKty0Wp2IcfPyt/1wOC9Z3eDxAqpvqG/pEwEBGCEw1Kop3AT9A6Yx9aGDct3n1KHxjP3HqdJ6idz3+1gCDmPOsrviso1ds58JknTYaiyb1zQ9sPrPN2B+OFxDKyH+bDP4weCrA9W/HGDRfjtf+7mnuYqDiO6MNosloqM0Z9EhLBW1e1BRE+9JUvWHeZAI3l1oLWAtBytbq1tfnastIwsTu4MAfN8VIa34GC1Bx/0gcjTp1KAoZCSNPyblmOY2PXtFIJzvNf+rmIx5hZWQuVwSZ28BUxYjZFkjB+GR4S16livFIMFZbnzEP0GtuXlIKH0S9nrcTrmGz+9IjKA==
Received: from DB9PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::16) by PAXPR10MB5688.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:247::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:08:56 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::10) by DB9PR01CA0011.outlook.office365.com
 (2603:10a6:10:1d8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Thu,
 9 Oct 2025 14:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 14:08:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:52:02 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:22 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:53:56 +0200
Message-ID: <20251009135417.282290-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|PAXPR10MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: c5660a3a-40ca-4776-2d04-08de073d62af
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qkz5BsKy7H3iLigI0S1YO2Fvg24g6uahtXiiXgyK7DONxC+ewUD+2SLXfiPt?=
 =?us-ascii?Q?sA93Mdgu0HBZp8T1Kn3IY/1cXteakDVqjR0nBG/jOxBjEZ8DJqeBEkorM7CG?=
 =?us-ascii?Q?haeIuEBRRIBFha0m+e4IgGkbPA/xNad9C3LC9Ab+C/xuvl+ycXhO37KaaEHc?=
 =?us-ascii?Q?oMk7xzjg/p5osZtIo6JkQqKse9ogl+pJuK7AMJsMZU1EUfD+IpeCLo6LkkoX?=
 =?us-ascii?Q?auLNgREuTWN56AFAUGiAwA33sDNU8UGry/kDBCiY1yzQ29CAeypmstl1EVjq?=
 =?us-ascii?Q?WB5hOQtv2NOjrkNzzjekvKaFVMOjfvH+pWmDT0+IuPbNfYDI724v+TAploHZ?=
 =?us-ascii?Q?uA4zcqsdSUUDmo/K8Xd+CGVV/QRsFg71OL/oFAMldwitVkovCiB2lRsTQvQJ?=
 =?us-ascii?Q?qC1d0IEJVgUHIrydxIEy36TVvq6vtp9dc+em8L8Q7clEMWnd1jMyTjuypLTi?=
 =?us-ascii?Q?V79k1mC01nwDtXyuXktay8Acm1pCulPfcaGefJUsWpz7GnePWW8Yww5vO18l?=
 =?us-ascii?Q?e2Ig/j0At0+YGozOJr+GZE/KwnG9EPNBQH85Novn693mmEAPCaSDWXCsVFve?=
 =?us-ascii?Q?g9o5ISpp+QUpvtOiBJr+3tXVYKorPSBFbihTX5pDC+9iCEubcJJco8CTJUWz?=
 =?us-ascii?Q?3DMDl676nypkdzqm0SpMvHQUaOe+6kz6Y9BkLBteRIg6QUXOT6xr4oBz2ePx?=
 =?us-ascii?Q?HfMjBfruCFIdggaq06e4uDCY16L890xHDlfO0tuw1dXaMd38UNocVwg4Y8vL?=
 =?us-ascii?Q?Fji5niZ83LmB/hY7mR+Ik71bWYMwSMrmFNSqstmGMhCKYtGOphvTY0PQoUdp?=
 =?us-ascii?Q?aa27Ewd88v0pRPWpzFj6B9URnY25H5ZtZVKrcNv2xe+1H/hkl32SO8CRlIHl?=
 =?us-ascii?Q?xU4MB6d2ipDN+k/ubhmud7aMlj9Jp1ZFwTtsb4dzaTKeT3plUzpWRAjTqpAZ?=
 =?us-ascii?Q?rEADVTsQHIC2TqQxfIxxL0Q66FKumvevcbRqWzkU5PAhCJT7SflkNtQ+7evk?=
 =?us-ascii?Q?NRKGVYwOvp+OxP2WAc35i9+A6xPh5EiTwL0ZGBye8uXZegI6Ppe2ZNuP1TfT?=
 =?us-ascii?Q?IY0H5MUA0nlYHEGQiy6mnc5e7Xuaxpzx77tG7OT0ERGTCXpn2maExcfSbX0a?=
 =?us-ascii?Q?Q9yKqUj+05rxy3NRGt4u+ujWfuRSUsX+1WOHQgQK/BiFKUXssoQuMrEA0Mzt?=
 =?us-ascii?Q?q13EyiUEDH535l0Z6uTc+etpD5UgoJbCVSdivi5THxehS8WP0uWvpn3SBkgQ?=
 =?us-ascii?Q?FhPnOJjg+Rp+FbhmhyPu8tRQgMGg3do6PPhMBd6v3p/rxsggHpVvur7mKXAJ?=
 =?us-ascii?Q?sZTbTkuXH0pfffvp/zj/agxO8F3lDpsOwLBts7wmhlgOW+8XWPltZIxl4XFj?=
 =?us-ascii?Q?f09oaWQ7ftoNVtZRt7Np53jeJ0/rrNIvLFVbEAp1m8p1/46tM3mcCasd9diW?=
 =?us-ascii?Q?QGuHpWpYQC+5O14PKnTvF2FnEjEDmdxxyRuP2UyVC4PvnAGKYyY8QfeoeAT1?=
 =?us-ascii?Q?WVZB/kPJslRX64rlTgV0g7roArMowBsQTH350lXZCTTzUnlWDR+qNEvLykqk?=
 =?us-ascii?Q?RE6f6WWzjWJtNllpTtE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:08:56.2085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5660a3a-40ca-4776-2d04-08de073d62af
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5688
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXzH90hpD8D1+E
 k+pxRvWvNPlqjgoOnzOIkcVp0pY3/F845Q1DCvGen3q9wexaNNSN0PTqQ1CnKSA5AQ5jPwRCg+E
 mb+swj1JNvLZlbQX8MSQOURdT3a8RZ9HipQR9tFgKVPJtSRPvAtPtXjtMSvTqQH8KUxlCO+SYdR
 5n4CeEuKLBGT+ccVGis8oTd9CiG2sX+OvQgonbX80EkEtcmihXNnxyX8MV0wYnvYB5dli9fBy9C
 zodn3Wr3Q4Xdjb6BPKO7vuaqq5LIi2MSpSSh1CaLrxHZQ8zMO/6g2c7eEJiWMwxzKvo7j1TreOt
 KiO+sj5mwDuwZVf2oEXJKJPYtvTTn4ywAJlJDzwj79s+A0q9vGt3p9xf3fyKIjBxWMBVYvFhE26
 X3flSTOti8oOlT3n/RwD5f/Kf+Z/JQ==
X-Proofpoint-GUID: oTQVUngqkev6UZcXR_efrdtnAo8kflIC
X-Authority-Analysis: v=2.4 cv=K6kv3iWI c=1 sm=1 tr=0 ts=68e7c202 cx=c_pps
 a=xGQISz8XFlhUdCZTtops1g==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=xZieeVS6YiIlyQuzhbEA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: oTQVUngqkev6UZcXR_efrdtnAo8kflIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kory Maincent <kory.maincent@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 02/11] board: st: Update LED management for
	stm32mp1
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

Remove get_led() and setup_led() which became obsolete since
led_boot_on() introduction. led_boot_on() is automatically called
from board_r.c

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/stm32mp1/stm32mp1.c | 45 ++++--------------------------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index cb5cab9f36a..af681dd82ef 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -247,41 +247,6 @@ int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
 }
 #endif /* CONFIG_USB_GADGET_DOWNLOAD */
 
-static int get_led(struct udevice **dev, char *led_string)
-{
-	const char *led_name;
-	int ret;
-
-	led_name = ofnode_conf_read_str(led_string);
-	if (!led_name) {
-		log_debug("could not find %s config string\n", led_string);
-		return -ENOENT;
-	}
-	ret = led_get_by_label(led_name, dev);
-	if (ret) {
-		log_debug("get=%d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int setup_led(enum led_state_t cmd)
-{
-	struct udevice *dev;
-	int ret;
-
-	if (!CONFIG_IS_ENABLED(LED))
-		return 0;
-
-	ret = get_led(&dev, "u-boot,boot-led");
-	if (ret)
-		return ret;
-
-	ret = led_set_state(dev, cmd);
-	return ret;
-}
-
 static void __maybe_unused led_error_blink(u32 nb_blink)
 {
 	int ret;
@@ -292,9 +257,9 @@ static void __maybe_unused led_error_blink(u32 nb_blink)
 		return;
 
 	if (CONFIG_IS_ENABLED(LED)) {
-		ret = get_led(&led, "u-boot,error-led");
+		ret = led_get_by_label("led-red", &led);
 		if (!ret) {
-			/* make u-boot,error-led blinking */
+			/* make led-red blinking */
 			/* if U32_MAX and 125ms interval, for 17.02 years */
 			for (i = 0; i < 2 * nb_blink; i++) {
 				led_set_state(led, LEDST_TOGGLE);
@@ -418,7 +383,7 @@ static int board_check_usb_power(void)
 	 * If highest and lowest value are either both below
 	 * USB_LOW_THRESHOLD_UV or both above USB_LOW_THRESHOLD_UV, that
 	 * means USB TYPE-C is in unattached mode, this is an issue, make
-	 * u-boot,error-led blinking and stop boot process.
+	 * led-red blinking and stop boot process.
 	 */
 	if ((max_uV > USB_LOW_THRESHOLD_UV &&
 	     min_uV > USB_LOW_THRESHOLD_UV) ||
@@ -672,8 +637,6 @@ int board_init(void)
 	if (IS_ENABLED(CONFIG_ARMV7_NONSEC))
 		sysconf_init();
 
-	setup_led(LEDST_ON);
-
 #if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 	efi_guid_t image_type_guid = STM32MP_FIP_IMAGE_GUID;
 
@@ -736,7 +699,7 @@ int board_late_init(void)
 
 void board_quiesce_devices(void)
 {
-	setup_led(LEDST_OFF);
+	led_boot_off();
 }
 
 enum env_location env_get_location(enum env_operation op, int prio)
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
