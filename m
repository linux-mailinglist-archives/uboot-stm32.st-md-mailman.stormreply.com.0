Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2AC5E309
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A069CC628DA;
	Fri, 14 Nov 2025 16:24:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51F6EC628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEG9Awt2976843; Fri, 14 Nov 2025 17:24:28 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7kkrf8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:28 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHafIII3NDQZnfAVKfWmYdDXaETHxqq4shwjJI72nfoeXTQsQwT+Mv94aBoIqN0KrYe2BYjYS8qTcSeyeQ97Yso/1hdzh2YWb11J9Tur7CC178IGQA0L2iwJkPV2yw+8l+s672lO6DTRZVxsq6MxNgl/CcfaRs2fHXhFwM4T9t9GZVg/AksVEcxGCuZAwwalL818yI/LE7T11LHv7lGg15pgUZ5y7BL0wKGQgQsvVJ81qslY6B3RsLaF63VcHCOYkV/qXneBzIMNUI1oAXgXPpxatnbAAs0qsY/r3zm4rXkbhEdVe6LJHNcjCumdri6ir7zj/kP+nffJ+KH3fzKuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doFPGlYp3SRrpe2pTMuv+IKZjQjOj3IdTVSTZXeqwKo=;
 b=gNMRVf4QBDNrydbhh+S4Q0RWzw7JXW8R9Cn6Qn/u8QoXv6tFXsgajMA/XXAfxbeiEj8V1VjKVWAr1ylof5+ctEgmgl23o6uKvG+fXCl7Hy8mbmPdAd+KtaMzENmxbERFbl8WFGB9zz5Ocf34quFErlnKC1olccRnPHfNMfI/3fPOD4CXPDUwYdF7dboBhs0qPgx0UIvmfjddHtky6ZzG8TXqH6wwW8uxYghomn97xxiT4w2pvwLFERy7V1hpHNGYR7MRcRRxlzLonuiV6T6a2qGawS5jZsoLrQHbw9fYAwXGQhABVaVZXRbDuDHq6Rndm3tTBL3ToHUZb2tJSL4F3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doFPGlYp3SRrpe2pTMuv+IKZjQjOj3IdTVSTZXeqwKo=;
 b=B8t/BlVb6njBvnQQm7pebdfJh8T+et+mltSrKaaOt8Gu5eDV1lzv/OTAlrbr/+wuaMDwyc56EkV+j2VsSsiWh1OHwD95cnuUgzrJQG5yrUtqO76Cj9iSZ1hYMTjN+JfVEnd3F8pYVr5XJQnhjpgMvYRv4UlD0BBOp8mtyMhKCNQQgDkH2ar9y7kKReCsrh9B9dh1N9qqqmX9habxKElz0OO5iv66uzLFDjb4qeRnQzp+dIgvSq++vIogaEFXEzgq03sbHSP0xOpP67XKbNHRcXZFcUnlO8ljcDKKKEGTW/3poG5dX2vA7adjXw9uWT5y7d1iaTbpzMNvoSiJYqXHKg==
Received: from DU7PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::22) by PAXPR10MB7927.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:24d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:23 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::6b) by DU7PR01CA0019.outlook.office365.com
 (2603:10a6:10:50f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:24:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:23 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:34 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:22 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:37 +0100
Message-ID: <20251114162417.4054006-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|PAXPR10MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c5df37d-07a2-4249-32b1-08de239a45d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OW0EWsbrw9XbR8SrAUHIjomY6nUpKkpVLNnhioCrHLR7eAP0vtdwXuSCszZO?=
 =?us-ascii?Q?FL2wZo2L8n1jK4TPjqbuOWGdzFtVXSEzRKV7KG6kFm+eF3of6HpGAqtZd9Np?=
 =?us-ascii?Q?axp13vtyikDAu6bTyhlp+H5vG2zusmJEDZ7synYdYx42QWaKEhkfN9Cr/JCW?=
 =?us-ascii?Q?VrfVLt6jA4QjQvQRpnKD3/uJiJIaFJ9YvcNq61ZXRCXGqhZ7M0b9g0teo6Pb?=
 =?us-ascii?Q?roHe/46uikBVDrm6E+j6slDXcNlWEczBgHoDspXapogbblA9OjqlmzNDNpAW?=
 =?us-ascii?Q?hTbmWNhGqoHu+eIen7oGykC2Cim7AlhkSGSPwsigpqiLxkcVIvTyAdrx2Mgw?=
 =?us-ascii?Q?7RHun3PgOIUBDtbEx2XGFfoB+PdtuKWvboIXPDhwzKKOeyiVginKwYPFqY+R?=
 =?us-ascii?Q?v4rUQ2Ooo3+iIGezyDeR2XE//QTfxruWJFdjJkT0hHx0re/a2RgceKuxlVou?=
 =?us-ascii?Q?Mnelg5lbyiIqbi7C3G7YpZxF/Hy9+S6vNZjAoKqax0u7GD/3pUUXY6wr/S0n?=
 =?us-ascii?Q?rWLeyOjK4DiYyE3I6Z7znh2+YLnHA0cimbNBSKT9RrA5CG/yhQvNNZXwT6qB?=
 =?us-ascii?Q?/d2dx1V/2yRW0IM9KALQr91/JcQCF8cvspLqYmrmNNTeWm+8csLSIpPYD5vU?=
 =?us-ascii?Q?FUXS+8pTEUulz2W0JREJNcWdOGO794klqL6pp5aMuzV/nh0npJSxFbLdmLhg?=
 =?us-ascii?Q?MA1rwfakgIGFeJMFoTEGbN9pez5FfjHdN1FwRU52sDhyLPvqsHvOMhDW0abh?=
 =?us-ascii?Q?Sk/khJ89dBnlyHji9V6BbZetVwM8xTWWhet6iFsfcKn1G6m81gk6DTtgA1U4?=
 =?us-ascii?Q?vz13VMXpp7vTuBuKEG5Gjxh+eOTgxxUSLkiANIs/mULghinp/ZY20Q/rAwRf?=
 =?us-ascii?Q?fEUe0Bl8FjTX9YCfdkxxa0CeWhXfPBKFjGTqHW4jeep5jsor0lIgB20EBgX0?=
 =?us-ascii?Q?klWHtcI12u9dpGg/HeQZ7utBLxCL2Ha49De1xiQ4XH5eUS0rfzYzVJ1kgk9l?=
 =?us-ascii?Q?uKFz2io8HqVOXZN/JhZx1mQLTKNoF+DESSVOb8mrpljOa6AUG+THpwwhMF8r?=
 =?us-ascii?Q?peiMLcBxmB/mqgiCBF2KzX+Hhd3OFfK1rZWy3UCRsD91FF+iwjjXPJKjWlpy?=
 =?us-ascii?Q?cn29jOpLCIx7g5tJ5wW0noE0F9DhTPWVlJzAGh7pZXr/1hgGCR0S+a360qAv?=
 =?us-ascii?Q?NgE8y8hRAX+iLtAX82E0qTUERSlvcOHl6MUMjqqo8FHTbTb9snv7lZvi3YoF?=
 =?us-ascii?Q?LvnA1EHiPeLuI3poLkR4kMwh3w2J/PnuZdS9uEVEB/t28SauZAx2QQ0XlF+0?=
 =?us-ascii?Q?yVoa0uKh4/jamLrjk1tYR7OX8UWem453isAfpB39FLbE/H5bcgZ52jhB+xre?=
 =?us-ascii?Q?+l3Fhg21kaF3mGs0XjtgdmLgNsjZ4dI2NZHu1PySHj3ntUfs5jtT/TE/IfsJ?=
 =?us-ascii?Q?KDtk+F3WtbTYKHPy7e1oHMuqElO+mKYC4krnpEPkBtmn6xJOpQTAdLkl+0iO?=
 =?us-ascii?Q?ZPwBjgs1H3Qb4Izk+6zEqmrF2uB3qJaKtWVjlBZYFFKSWlvo9XrAGND2woS6?=
 =?us-ascii?Q?WNI4Ny3hFuqInf6hxg4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:23.5373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5df37d-07a2-4249-32b1-08de239a45d1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB7927
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX6M4j7vXkC3X2
 XDXvA9YpAFnf1kYfmj2zRfV+YwINeyCPGjFeb2iCiS/uYEX03wJX3HrpYnxJ6YA99pUYozX7faq
 fjS6Dnc0FQo8UqTsCG7c7wnITYdwHcKqfwS3Ihc5C/Y8Dyl+aRYoDZiwSKTrRY0P9WIGfGx74FK
 QhZvbWKecnHAS73ugBhAIaCBsj1iRmTZsY9GHGCh7Pe8/YStSuELAC6fkAFyEhyzN8e/oZnRksD
 jGXKsvDY3EB7INzw/U/EQnZ1X+ULPLHls6fkEY9ZoRHS/1paiC7IE1ei8T+aY+fzrbURrADN6c1
 mTTka9aKttd6AHkGtCvIEjz7ZBDUGIGYSDWHwYCW+3Si6RK260L9PYsSQTUJC6/f6LLo0/RnGWu
 sNXuFuYjZHc2v/h7axlwl4MfHid1ag==
X-Authority-Analysis: v=2.4 cv=Xsf3+FF9 c=1 sm=1 tr=0 ts=691757bc cx=c_pps
 a=ylwhU6uZkk4GPunyVPrrDw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=Uv-Ztf9zrDG429dlX2MA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: KlcS-uei1fR1tTRO6PO6AiB7ecV0lYZT
X-Proofpoint-GUID: KlcS-uei1fR1tTRO6PO6AiB7ecV0lYZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 03/23] board: st: Update LED management for
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
