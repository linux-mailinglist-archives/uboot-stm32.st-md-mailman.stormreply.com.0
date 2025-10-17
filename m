Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3BEBE93CB
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 16:38:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB336C597BB;
	Fri, 17 Oct 2025 14:38:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41D2AC5978F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 14:38:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HEZfNq020134;
 Fri, 17 Oct 2025 16:38:16 +0200
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49uekttjra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 16:38:16 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svFDlSgeeoTfoKISle4PczpWiYvEvVx+UoGbrSjB6oFqh9S5nBkNb0o846qBmStj4b04Z5SwTrSENQ1YgF411zn87EbNeUCjMDEBeY0WyE/2bInx0RnkLJPBFIRMg2WWglc/fwhiOpJsd4MoM1ELSX0K8A1XaVu4orzZTUq8VQ+QHGjOJDq4+Sx3/7waRupsNNKx5eM48W84lkeTPnmnBVIFDzqnWYSm54lNY8UjhIXSH9vTEBdAeL2amxgZ4V99qZuR0h8UgPGSthylOMKh9xejSAIAfqyYQdfadEZL8i9W7KABJBjxgyiY8+np9nS77yY2m8shTt+ndSUvLmbD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doFPGlYp3SRrpe2pTMuv+IKZjQjOj3IdTVSTZXeqwKo=;
 b=OHdLCE7HJL/VhlRotBgAPLSDgN4ujq297fa1oHEWe9gMbO3sHkU2Ov7kwXKRiySeu8PYiN5yxM3OWiZLQyXucdQi82oslnJ4sRqkIGZyrj4UNowsG7QC36HpAldHpTeA/zQvnhHwc4i24r3J7e8+NBLc9y2f5vysZV4g2/KUlABoHKDaSkvMxKpDgzx4JZ2RxJROE04xiPWh/ew2TQtlRMAq2FZ/sQw7cowLpYKF+iwUJWIqjbB4aSFe4krFHVpp8qnkYSGd+jBaLQoT4JpzfLestQxT/wHMiYM3AUyuKunNHorvQ0tDBd/ZwBmXe5CKLMzFKWsiMJX61h3H0e57CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.41) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doFPGlYp3SRrpe2pTMuv+IKZjQjOj3IdTVSTZXeqwKo=;
 b=m/tIvf5yI9+AxUVT/U0jnzNxgc75HC3GPIACSXOHxEcZN7MVoxjUgp+MiWyAriQGtL2Xxr96npVHAwd+Y5n7N5A/zth/8elFanP0ouEMO8TK0ovH4lFW4GTho3gKAWiIukSrrtS+p80Pvp4+5DgJavgkQRQuNIEERH6XNUv6d088iAfb+RPDf/RESme4TPTHtVNAZdNZPjNgw13XcUgfj0fE27BRFhBhsowyZmOKylE0NjrtnheNU0i8TzsKwBelciYWcnkigHQhyyKWO6AOCGy0zwgFxp+uMAqyYV8xh+8O4/fKtfJC/V+EAtvps1eQv98LXl7nqhwxV1Fvtm+5jg==
Received: from DUZPR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::15) by GVXPR10MB8926.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1eb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Fri, 17 Oct
 2025 14:38:12 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::5c) by DUZPR01CA0051.outlook.office365.com
 (2603:10a6:10:469::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 14:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.41)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.41; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.41) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 14:38:12 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:41:16 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 16:38:02 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 16:37:47 +0200
Message-ID: <20251017143757.202571-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017143757.202571-1-patrice.chotard@foss.st.com>
References: <20251017143757.202571-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|GVXPR10MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a7de14-a102-4989-d66a-08de0d8accae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p0QiVHZk0XXKTKhy7xh2eB/ceKismHBxN9+Dic3K6mRj9yQVPKufY/9FlYUH?=
 =?us-ascii?Q?6NRCMJ7WWwo6ZXVz9s/CCs5Bkb2id+ch0CnPo2xg88PvBT94S8uv+A9XCr25?=
 =?us-ascii?Q?7RKQFUU2Bp5mEWe/2eEqtExwBQi8tUjFOQLPsw8fKpbF9S5OraPQ+4MTuLV+?=
 =?us-ascii?Q?+3d/9ONWvqWjZ3l0RUY0uUa+O5fIP49fFNXT/55mrTaj9elnUA4CljXW0IJ7?=
 =?us-ascii?Q?FeyIwviViGDKH5W+7dcFNg41mAJ6vxzUxOsur+Jz8zw8cM6EwFVj+miBr/LM?=
 =?us-ascii?Q?HhnR+TXqGWR3Xdjqy66KloUojoKkaKPeb68sznAZy5bKqsGfZOak/Ey0kCfd?=
 =?us-ascii?Q?5Qd8SLgZeU3N610R6iROjmjc6XzprmgV2CZfDjuDxHwTz35IBsDVi+ABssGf?=
 =?us-ascii?Q?8ubhoS2SzduQxXyK8m3MteyJlYUfNo4bmZY8o2Ly7wZc9HX1OuzXsqBkvU9b?=
 =?us-ascii?Q?R7SJIFk/PoIlxr4IPDTNWQmYDI8nR3W7Kf/Z4J2elXDPEKu2yMkhq2kDkZiX?=
 =?us-ascii?Q?8Qe75ZtVJmnQOA3iuwQVtwSOzsUFur5hIJ+lp0MaXg/OZMkHDxOTEWrpTMBT?=
 =?us-ascii?Q?eGd4Q3IhFVm+uZQm4o/7GtTwnI5OALeAhdD4QQ94j9W90YqrfmFLBokWHCGU?=
 =?us-ascii?Q?3oZ2b67c62fcud9xOzXpL4k0UfYG113zE041r/zz8bq9WjpHCXYCWA5WeVhL?=
 =?us-ascii?Q?ChEK7mkZ8yYlSDRHbohbr8VKF1hxX3exDbM+A1xbYFeaiQDUL2UCFSpA4SC0?=
 =?us-ascii?Q?m6vvOHUj4mxliMlWmtepStY7UcKZ0I8nL+rbgM6piI1YSf2awiLxWn9kfyl9?=
 =?us-ascii?Q?0GhB6qurmRHPSCYTdyPlQwzLvtDyLMgyQDk/Ud414roJ2uFqUE5JwCTyLXUv?=
 =?us-ascii?Q?SlvvbMDmBaxfdGbTiBsyXcJZ70uJddWFMNQkvzt0iX2q8ubs7KsH23wVaJKE?=
 =?us-ascii?Q?E8xs5twd5rGy8uEdGrTlrbQ4Ge9T8ffx5DF3Lghn2nEL0OAzFv6X/z6bbTV8?=
 =?us-ascii?Q?Wa9on1zf/2RYW52aAP4Y9MfWDS7KZdeDHzreSOYmSmyyOgy2dpoAIoKYLSwG?=
 =?us-ascii?Q?Cs1N3YUtX+q9js645zrNdjOV80vY9TNzk1qQ4TEtS6plQZladDIh2eyPvvEH?=
 =?us-ascii?Q?VInB/FwQPyK9EnHNiXL9HpO/QRAH5+THWHNHF/VXPVzMvaHxmm7fFeXSXkH2?=
 =?us-ascii?Q?GzytcJn+I9+gkMvcytJz2XUCz8b5tRtYshuhJ7pH9JliUoVh+sgjICfQ3iQl?=
 =?us-ascii?Q?WgX1Eau9727w8qR+5lSn2TjZQjmsnBUWYgrx3QUzBfzT+OXsouRVY31osysn?=
 =?us-ascii?Q?N1Y7e8uJVbXz5XPfRYkSCqcIeFXEhaVVrF0gDT0ude6twxzygbRAgzEK6JlG?=
 =?us-ascii?Q?EbUXqlU4WBiu8rIpVPgMZa8FwwgPol3zzzPJQJz9/QNtqB7uZVLz5TPlsyhB?=
 =?us-ascii?Q?znbiW1olBQWTs52UoLmGv2i5WedHpZEhBvnlIf6CDomAKCUvVfeqwPOcYMXl?=
 =?us-ascii?Q?witA0LrzVs6fIBOe54uiL+2In5Wx3F6qH8DRNyBIKS8iiLJyUlRW/Xx6GlOJ?=
 =?us-ascii?Q?u7uJpGaVqVQfwEQi7ZA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.41; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 14:38:12.2789 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a7de14-a102-4989-d66a-08de0d8accae
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.41];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8926
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68f254d8 cx=c_pps
 a=NX6+zUTUVjFpPDmHJeUQWA==:117 a=k+92ZC+kR50ztVuylSZIGA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=Uv-Ztf9zrDG429dlX2MA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: IvY8AAe3LvICy6S-C9O-dxSCX1rwh697
X-Proofpoint-ORIG-GUID: IvY8AAe3LvICy6S-C9O-dxSCX1rwh697
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDAyOSBTYWx0ZWRfXxQMAkJgdJggI
 qTJyUmZCQvnCmAswXsoU5YldXk0yZaQIPog//d78Mgm+zLF1mzdpaotjs52efjVQDW8Eh9yGLn4
 pWUWbW38Wm50rh08WyO1kzxPl9VUNcR3vLcKfhLBlyjfMYZrZ9n5EVopRWp31T3Cb5Z8itOxu9P
 aW82XmAqh8E3vn57mLiDGUege76SDZ5CkgbpoX5F8hT+8+fRthqixqO+96wso+teJ2A8VO/opcF
 tV+co03bjk4F8U2Ryb4VDOcqmJndWW3H48r2S2Am/6/4L1Zu3LKrC8OagA2nOTTQ6MYmCsihajV
 ouLCs3O/6x6gAzDlya6s3UsREU0xDxXgmMHupklLm8Z2+hwYIGiaA5HDpFn/lTBMryeiG2WKhv+
 eTkKAXF8eY5HZRD4gh/l/J52tRiWJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510170029
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 3/5] board: st: Update LED management for
	stm32mp2
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

 board/st/stm32mp2/stm32mp2.c | 38 +-----------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
index a72056e12d6..7bc7d2a608f 100644
--- a/board/st/stm32mp2/stm32mp2.c
+++ b/board/st/stm32mp2/stm32mp2.c
@@ -58,41 +58,6 @@ int checkboard(void)
 	return 0;
 }
 
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
 static void check_user_button(void)
 {
 	struct udevice *button;
@@ -118,7 +83,6 @@ static void check_user_button(void)
 /* board dependent setup after realloc */
 int board_init(void)
 {
-	setup_led(LEDST_ON);
 	check_user_button();
 
 	return 0;
@@ -222,5 +186,5 @@ int board_late_init(void)
 
 void board_quiesce_devices(void)
 {
-	setup_led(LEDST_OFF);
+	led_boot_off();
 }
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
