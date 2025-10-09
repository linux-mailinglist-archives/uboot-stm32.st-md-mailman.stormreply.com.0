Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C4CBC9700
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 16:09:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41226C555B2;
	Thu,  9 Oct 2025 14:09:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FFB7C555B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 14:09:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599DRl4I010913;
 Thu, 9 Oct 2025 16:09:07 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6h4at7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 16:09:05 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBpJpGiqD2YEpQLFWPeMy3TH/9UP4YlqYfoZM3l4EZCRyIOxoZ7rmlW+QdLwEYdsyExnMENyGoRaNqfpRGX6tXIhmWtscp+msIeP+e2HE9EPxWuQgwaGR0ns920CoHZf3hXvC7JUADGS202921uPPS4qX3DDje0OtgZQz1GQ26mRIa5lFdl8weU88vR5lZqLkpfIsmUBJL87FoPw4iSbSTToBVygm5sYjDVqBP6ctl6sH5BhXl+zIfGQm4JznPYa8cNokwMEvO/SprUHN6b+T9mgaKhC8eMTUVJVsASn3FwEWvGRPjp1Ii/jk9yrLrVJxjqv0+7JwTHgMfegQlSTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3evPSFtnoO6nsnLEngSX2a2bK5B/qbobvty/T3eSjI=;
 b=W79K5KdtZgJRitl45cJg38sMLl8D2KvF6nlDry3S81vnXHaQc537Wzi9PR7+07WYs4ydMNCPtopZ7kDyg/6wLbcsLhnfhu8eeFJqCJt9GJ5ymbQuxKTDDnomtKZ9+pBoQj/NlApcVz4TW4uxuOTJgeT+ZMJd+nXpWZfWgsvu+PuDvAfL8V2nADXylTM7GIeaJi0fx9WUa9ZOj/sOAQyEBbLMPysuGfbwO4OhZPyTzfaxDrQmpxutN0UJon1p2LYYpFO+xL2Xj5yvNliPbaK5HDOoiPLhaaLk2P7y13DeOfmdvXY+vaI0v5VB5vbfBJQ/bqAe3JTRUH0sE5eNWKZDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3evPSFtnoO6nsnLEngSX2a2bK5B/qbobvty/T3eSjI=;
 b=Yl6KoYIKwTZPyxfbmc4Dz/rMSOidjGdxc8qZA1ZfsXvu6cCmv+Q5LaO2u3+19K8T3E71zsiG72biA501Jn9XoLIcLfmmnYR7fa1CMoRpJNSoyKG0l+NsuLNGeWuOjTDp1wV9lDGHPEWbh99owFfgfJOpRWyMRw8xeD1FykUXjeEGCMTHWFmj+dgJBq2VOsGLLim6wNUaefOCECwyzxlZGShL1whXOVPT4uaZaqYsixOeNNcsB5qRPNUrb436azUP2TxzNzOPKH/SyI7Jh1SAd4ERLKFYUnld5M4g/Bj6IuG9AEL4WFzuMgmtVKj9Eg4nwKfGnRGPkJb0k2u6KMdCXg==
Received: from DUZP191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::13)
 by VI0PR10MB9392.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 9 Oct
 2025 14:08:56 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::95) by DUZP191CA0039.outlook.office365.com
 (2603:10a6:10:4f8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 14:08:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 14:08:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:52:07 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:27 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:54:02 +0200
Message-ID: <20251009135417.282290-9-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|VI0PR10MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: bcaea889-ee3c-49ab-5eba-08de073d62b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dn/aLtQRF7ZIgHw8VW6WIh1MLBOUOpDqjbxiQcSlrcGJN/gKxSdhSEEU5o78?=
 =?us-ascii?Q?CpmKHFH2OEwFMdRKk2KwcIjweiVIIUjeo65J902ZGb92gWp8q0CtSyazEw6W?=
 =?us-ascii?Q?UuErx+aLBlLT9Ih4NCOr1nP5G1BJsoXPRilsjIZHamOWXQtN8/LGtjqf0HQS?=
 =?us-ascii?Q?5ebbSMNb+KmZeR4FXZPP7wQcGqzrwy7BcvMmsx7Txp/vLdCK6T3G2gL3YluR?=
 =?us-ascii?Q?bCI4eZI21qyElCqLDzIf5nkXQh36p7zAcA9NIMoA0aVF6XU7C/9ZwxsiK2rp?=
 =?us-ascii?Q?k58B0jLLN80/Xf1pmVI4RQZmsI0zVqddVTbnEnoFN9pb5oTsil5ACQtFqUoh?=
 =?us-ascii?Q?4cagyrYzs+bAk6zozCUZyhvwjCzUyTdj6tHmT47mGf556cJCdzRiPfIkiDND?=
 =?us-ascii?Q?aMnFh9pGZxymSISY3ynwrahWBUN847OizT7AjGCFI/4Lna5ltC6SOb4HGhHg?=
 =?us-ascii?Q?ah6+0wrjKTeIVWq8mXRNaAdASLwXIiAUuhI/auUF30fOdjj61y4jPVmEJ5NP?=
 =?us-ascii?Q?OgBzcLFm68CKo5YMf4k5ZbctFl3vPseSIZtT2zEfbpORsYnZ9aRklXyhD34o?=
 =?us-ascii?Q?qB6dXmUe3y8KoQVqhUBpyX992stKtDphaB9qi5U9EU9J7kWfCj8CJ/XR16UX?=
 =?us-ascii?Q?JXx2a8C6yIGeVe6UJA1kTLq4p2neCou6DMGkhw6/gj2eTJgyU+EruWdyWbda?=
 =?us-ascii?Q?jTTk+ZHQZ9ZDxV7brt9PstIY/D24/xSCIIuuEELNPcpu9+WsC6L3/y8IIsoU?=
 =?us-ascii?Q?ULRnE0a+2A4ZeoXf0ziSa7G2e5UUykfi3OqJPjzQ4ESsq2AuCiB1m7uyaoC4?=
 =?us-ascii?Q?7GdA99FV69+9F8Ejsprovh9yJc+RCe1F69w5tmtLijumG55F/rS5SIeTSngB?=
 =?us-ascii?Q?rWnrQJf0xDvWS2ETsTh4AA0y3TJMIkVsZw6z8fgSkQDyUuAYqoZcdFso9iAv?=
 =?us-ascii?Q?UTgDoqzc1d6awPNn79/REQj8vbIEV2wzd/CDmO9vM/ft0kItYTiUQHelQkHS?=
 =?us-ascii?Q?n9OCd+jsf6xTlAxBnn0BGnv9Lma5WvlgeDcPlzos5lZdgPoUCwD0FypRS7sr?=
 =?us-ascii?Q?PcvZ1kFBOmjkVuHKvBBZknKgINVKh3lMHiFclhVAls1nkNrFS/W0nG5mh2nC?=
 =?us-ascii?Q?Rh7IKvRsbQxDGXlKccX2lJBVoOp3O9yHTq4jnTFjAjrGJ8tNjcPbHJC0APfz?=
 =?us-ascii?Q?NN2kslsKT0Knz5Z5jMy11UbL/AAvP8PqbI2jhN9OfBJetlieoCvWhFrF/o+2?=
 =?us-ascii?Q?iLok36ZsKurdF4iPjSixSm5T+oVV/EBtJ5yHGP7jCdBD6e+6Lm7C4adq7aKA?=
 =?us-ascii?Q?k/MtqvaM+vRzIL49i6HqaUqeky436gMXT/ebudf4coVAA3NzuWQfs425TjR9?=
 =?us-ascii?Q?+Hh/ibgJ+gCRyeLbQZFenpvJT8E3hEf8lGMVHFkr8ucLNB+Y6pdlKBo59YkW?=
 =?us-ascii?Q?XAi/ZQ+CPG2l5AWumdJHUVLqzQc4kIEhcdULDk2bgsJKw4oyi2yFbUAqXqZL?=
 =?us-ascii?Q?sMBKD+CE0WIv6yJxFFu7giMhQ+XQ9Fre7NXzEOgpW4QV2AVNuExRDz0hY0pq?=
 =?us-ascii?Q?KvswB2EmPlonqRJ4Kow=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:08:56.2083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcaea889-ee3c-49ab-5eba-08de073d62b1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9392
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX36+xyXJaAQXH
 alHTAM+aP3WaZWgc957HgAVARpfKgvf2GQwfHMhGSLaBbDRnFmKeRuZglOC+HHbwg0etJYs2Ioe
 Ok9QRegBBJiDOHWk82TC++EwUxxbSVavUF7yhOfbQ6rWXdAnGQeNUACAVCDdfMRL9dYwQBiIwFu
 K/ZpWenG7WqBgaiyFEwj0nn92AyULcR+YuMzPElC+kzQBidu0yYLBvkC7yjuMPoyb2Iy53LsfcJ
 VmL8efn0R3SnGygn8v0I7hHjUaYFtuoPX5x19MAuIeiz3jA52wya0mLcXO5VViAsj6mgiY7pybY
 xTsPqACKS4FwE4XRQqqBBEGnjrV5kJdEYdalFyOL1Qj7y0Nhg8+BwqD2iAR1AzU8+3fxSpg5f8S
 dgTh079EoFDxmsKnSls9y7u4NE+y2w==
X-Proofpoint-GUID: ez9zG13HVuZqOTKWHOSoEanNrAAMZp9z
X-Authority-Analysis: v=2.4 cv=K6kv3iWI c=1 sm=1 tr=0 ts=68e7c201 cx=c_pps
 a=a6tTacaDLMSVGfVoTJ2NOw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: ez9zG13HVuZqOTKWHOSoEanNrAAMZp9z
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
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 08/11] configs: stm32mp13: Enable LED_BOOT
	for stm32mp13_defconfig
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

Enable LED_BOOT to use led_boot_on/off() API in board file.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp13_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 3283e910219..7367525dda0 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -72,6 +72,7 @@ CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
+CONFIG_LED_BOOT=y
 CONFIG_LED_GPIO=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
