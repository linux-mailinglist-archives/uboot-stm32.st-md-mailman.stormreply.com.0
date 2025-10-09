Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFDEBC9709
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 16:09:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7221EC555B7;
	Thu,  9 Oct 2025 14:09:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91563C555B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 14:09:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Dl6Xp012220;
 Thu, 9 Oct 2025 16:09:04 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013005.outbound.protection.outlook.com [52.101.72.5])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6h4ast-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 16:09:04 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vycHRUuNbg7jxakBSo7ZNPoqqi3ahxEIEnxgNom3O5wiZVCOstK530QXXFCKWukLo8nk2g3hVIFBNRrfl9XtKTDZwYBGw2n6jP8iNLwg8Zwfq+w1K7DrXqDLxQRdiIl8uw3LfAPNGqnU2zvsPVW3zKIBfsE/wtFJG6JCQEh77HKCeipXqBQG89P1YLPdi30sorNfLwIRyMW+kCnbH+w7tedIELbX4lSP7emOuruo21RYa5rZbiVl+eTwlVDXLXI8QV8uPmYP9oLbIgyf3ZvKDsMB3sT5tWscc2ntLDGGAYhfzkRBMA2hPlj1cX/2xcgev720c+WC7/xyJUgLcB6ElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJS+VDpRD+U94iUcl0xHJz+2zKBddcnzn89FF0rammQ=;
 b=Jh6qupb2AwBq7ZXlDGNqp5MbxnY+fIAAcJrMxsZR5ahkrvR34DjL9ATeCN3xaN88G5eYvCZdLgwkvaomQH5ZssU6wr6uByZZuL2Hc82b7tmbzo1yS6SSrkjfiq0almhS93BmF61De6WCDM0xwItUQ73sbLqayeE/BMGld5aG2SwdiB9E3yrgDweJNtldGM3Ghbzq7dXW6Q6hN1nqMLZH4UuJU+I+2gRSjrDkr0YRBfY0CyoWZ5aTY/u1z3vUwSnNQDDPl6tRCf6+drYtPtigqZ2D/yGpRwo7fmQJST8kLh41VSWWfxe1Jx6mB1ilsBR0mwKc0GJImZMJbcvcwUz/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJS+VDpRD+U94iUcl0xHJz+2zKBddcnzn89FF0rammQ=;
 b=F3hOJmam0PdaTgStr+P1ckxx7Uc6kvUb+8mf5RhjuAMQuGYQoN+q8JUPm6MrCKB3LPGKfVDzEETZc7SuhDbVAiznEo8xNDXHg9oOZZRfOlhEH0hdaIPm8nqItUFbSFZSzpEKmmHGKD6dMZ/kCWBVVJ9HEwcpDvE1ogvqz3XswDI9dtx/8s7Ha8OrqSMMnR8objiueaxJpw2bQhFelJqZ8BH9rubnJHU7sxzwTCTeRl64YIumTJNCLV84RHFIy86yl+cvEI679VTiVLHfB+Nni45xHAA90uGwWfW3my7IedYHS/1yOXFrsRrjfIFvxI6Kv/ht1xPcAlfI+07a1cTkBw==
Received: from DU7P189CA0027.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::22)
 by PAVPR10MB6839.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:323::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:08:56 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::d1) by DU7P189CA0027.outlook.office365.com
 (2603:10a6:10:552::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Thu, 9
 Oct 2025 14:08:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 9 Oct 2025 14:08:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:52:09 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:29 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:54:04 +0200
Message-ID: <20251009135417.282290-11-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D11:EE_|PAVPR10MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: af411e8b-11fc-49e3-a3c8-08de073d62ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dVRIWZJ6kQfPhhLmhUiuyDTMVuBJN8jA2wIdxi6XlAJcMEJvvmLf5lpUPoPa?=
 =?us-ascii?Q?wQs6ekoRkmG/5JgLoQZS6bvMf565x3JihaOZdHwp9VrZdxpnrnyoqm5fYiu7?=
 =?us-ascii?Q?B24IEwtfLpRPYgx6ZsBgNgn8BCVs42k7xQgUJmWpqo91B6rYCIF+Y8ckWBTK?=
 =?us-ascii?Q?rSKVjEHmTEmfVTL3hp1ZBeYvOAemSscLytxDWTq/6Mpu6xK2ayt4PY/1yptU?=
 =?us-ascii?Q?l/TaxTprMBAJoVwD5Oja1Kw4C0OXN1llF+F+dDNSlCFk0giqf/pF2yBZtiBF?=
 =?us-ascii?Q?GWqxkaHDYAm5iwN485chZBI8MkJH1dd7WKEjIeopABoF0hRnUqSii9BPptID?=
 =?us-ascii?Q?PY8vKUVbO+xVM5E72XOvv3WU7z8hdTP82Kle6LzFqN7IzqwN61jlt04Lt84r?=
 =?us-ascii?Q?PoWJ7uNOZznrT4YW6qWhMuIvdlcBENH62Jyg3SU2T6ewqslRwtlhA1/7pVaL?=
 =?us-ascii?Q?mGUTcT/0jERSp++qvm0P+ydmA0Y+NZnB1OVvcReDKTBUJ7s4kjefo/LhnMfy?=
 =?us-ascii?Q?jdkk9FnB3U52klahHuFg3/bA7KhCSZYZaMCkEJ2cAYB/dXuBhLXPgPRwwomh?=
 =?us-ascii?Q?s26l5avxcKDZaK0iPs+H2sxhJIHZqF2NjSpNWPn1hOPQQ5K9NP/KFbY4LvvP?=
 =?us-ascii?Q?vCzL6uU0Tj8PrnsFKfQR++huVNPNDS5E5YyJwgZPi2dLZ/klYrvzkv+b9KX4?=
 =?us-ascii?Q?0lCxNrSwu5/JyLF8QFXgIARYY/HEytrfsqFECo0+3E2pJoDUK4itjtYcqK6F?=
 =?us-ascii?Q?bMUuZGHh/k8S3IF4X3vhxz57q1bYB7cQ5tTgRvIKycBU2MJ2yc71EhGMtDfH?=
 =?us-ascii?Q?hI4JgjNp+C9+V8bzS1CJzM90F0M4GQBWHnA30fDNbGFzHS4WbwJRtwgbWOAe?=
 =?us-ascii?Q?edH3N6YOvPbqzx+Zdmuf2G5HAT5VeGGWGS6tBxXmet4GUxOTgJ51E2PJZnrZ?=
 =?us-ascii?Q?lqKI0EWpZGZDO/lP8vxfvrn71hrCUVFvicf5Iv8X+qEkdir4/IUgEoLBQ96C?=
 =?us-ascii?Q?MxcXkx+oyNXrOAiCDvS2X+I6S43colZlCt4S3x7VtL1RXPtEPbBE3F7JKeVY?=
 =?us-ascii?Q?rh+LEVw0uEUPo65a9yDCCNABFa0h8mEfYz7u+E8uucQwHJUOAKsjffTTgk89?=
 =?us-ascii?Q?drJ6nmitv0rwzTHgV4p+0djZlDuohSR452xRnlbpGn//mgE0QfrNtaCt7P3d?=
 =?us-ascii?Q?0u+k0zcZ1a6wIhKG4U5su0Sl3IEpYW3v0wyRtELV8jIaBIl4E6pONMxElMXG?=
 =?us-ascii?Q?Rl5oNxfBjrpVIhvKY4+l7xyppOVVXqCGHUUVB4zphbv3MzsFmN64aLGvuq8D?=
 =?us-ascii?Q?YLfrXhjEeGGufl6EbX6RVleQh7k+/DQwU7qxbvvVzYNBEWm/qMeZLUMMImXA?=
 =?us-ascii?Q?X+rV3DIkf5jbgIe1vGwc8lMyyio1QXstOeuFnBybLoj+wlsJvwM+erbHygpp?=
 =?us-ascii?Q?l/0kpbdCHJI07btEuGJ78dZsDWuWIrgQZVL0n1dO2pBLe1XTpY78jWIOqsBo?=
 =?us-ascii?Q?yXFenu53Gn+tNBH2ktct7QwyRnncXwJkHMU0YLhvEZ9/9OeZVzZBkFhnfI1s?=
 =?us-ascii?Q?pad4xcNDhcXzhGgLen0=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:08:56.2076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af411e8b-11fc-49e3-a3c8-08de073d62ae
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6839
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX96Cp7rLnIm8a
 X5f37y7YwhJKKE5019csoRT1Wzw1FIYpurNXZIT3kjMHRP5Tnbup4jrEPm5/oj7ulq9lnJg3XR7
 ag4JE4ijfB32CPiAy9zGYysFc1r4Yw3ZhhNOhSZLwZnBx13D1JRojhL2o9n5rO4X7SEM1eiakrb
 nxwS1SIiW+/lmHm27n97o53fv9t+YBLK8ITVuAkWIScq0cJDcqfnEGYf0ijsQdkXDH4gHfU747L
 mIF/ZCGlbj4vHBjzCPG1L8Dj1M29G1GKGd+qTlBiJabi7JTbLiiQeruzfDjllkVdU3U7tN5MRkD
 h+8IU2cIVX55G9SxyjMUScvpek2M5n3xW5EF6AN6gy6v2b/rw9hnTZm6lTyUmpZj1YLfBcVvUHN
 vbSwM4WEZNdM+yfVcZSP+cx5CHsqNA==
X-Proofpoint-GUID: GhPiZlrq4c3OER7fTXk9Mx4yHMeYFe5C
X-Authority-Analysis: v=2.4 cv=K6kv3iWI c=1 sm=1 tr=0 ts=68e7c200 cx=c_pps
 a=/ZHAcEesow76L0gi2kiOkw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: GhPiZlrq4c3OER7fTXk9Mx4yHMeYFe5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Tom Rini <trini@konsulko.com>, Antonio Borneo <antonio.borneo@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 10/11] configs: stm32mp15: Enable LED_BOOT
	for stm32mp15_basic_defconfig
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

 configs/stm32mp15_basic_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 79593cce9fe..15edea314f2 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -123,6 +123,7 @@ CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
+CONFIG_LED_BOOT=y
 CONFIG_LED_GPIO=y
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_SUPPORT_EMMC_BOOT=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
