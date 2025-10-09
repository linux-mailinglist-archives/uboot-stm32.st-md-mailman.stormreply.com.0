Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8838BBC962D
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 15:54:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27555C555B2;
	Thu,  9 Oct 2025 13:54:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9279C555B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 13:54:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599DmMQ9018999;
 Thu, 9 Oct 2025 15:54:33 +0200
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6cm90w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 15:54:33 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNX+zKa0zp6PmEBKspzN8f1pTplcoVjcQ0z6VOUdk3Dyp607rSnjWE/pe6k3PXtaS0cddVN5h07JCUaD+YosI96GT099Gj9KdOfL9KkFMuSNTe2x2ddLKC+J+end+bhSLuNteYxayPPNl1AFuOgZe9Au/66CIlmTV4d4vEDvXBDKa39cHBmCFrWes6SHRk23y+eQ3j0vgs11BmB7eE5J0/DNUZoqYsCK6JVvcJQARmW/sF3t4lAVb/037aLC3zkIgT4DyFTZmSk1lqVlB9vxkodRPy/9bF0mAgC6qustmn9atsmyzdDBiQli1+VYUdVrWsFVyRgmB6k+thc0avEpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/3Mf5xtCYQhClyCEPXsn8P9NYFS3H8fKFVvcR+V6IE=;
 b=xZbw0Sydr0tvwBiEwT4Z+k9sGvE9rbhMf9zFa8+jVueWlrGQ9AadgtzTd5It5cCIuoVxYbsDqxujgbVcDm4qzpZp6sVVGIjKI66XPJo4xumKuDGMSkcbOGyWOf8wLv6HYIwHCZj5el99a6FndQs7TzgcZUcekCn+bCjDOASTxkkCsWPdE62l5pn46o3S0LLjzfrJ6K+Wujv8o14oP5G4K7vMvN6lAX24HyUl4FObGc6EX8UoohdvxgmX9gisvrJ2cLBKvd37Kx2hMjUNZe4/V7Q65P2gCXHkUlg3C1j/MpP2IjLtILqwpDegiojhVjFIaI4/7ciJNiPUJbZGvrhmyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/3Mf5xtCYQhClyCEPXsn8P9NYFS3H8fKFVvcR+V6IE=;
 b=ASGnpvR+GVGXn4d1Nl2nOW6CtVB+k6vOBPiXgI+F22fynYDhLhEUWk/Pr9/TfZzyV0bYWRKO4q9RYVoPKFNsnLSTv4p4WVqpRaMLogubvD6owTI7PdJcD2NS2KX8qS2HhI5Nu84q11I3Zq5d2xc5x7vGLaF4Rv6ESCZjhJtDt0CVYBvNT6Caa+GtxxnPDxX3tn7GKqkg+2l+1B1/2kuoy3NqDrIBRE1+7DdGTpg+aJP6XigytMYgBky97NPFe3+ME+0QCuYQAonPdkQoiSYesr3JCX5zIQ+agx4qq/cHhlGvL1aqlbh/8ogg5oQwIkTO4bU7uLfytycD0u4gGu/r/A==
Received: from DU6P191CA0062.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::11)
 by DB9PR10MB7954.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:307::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 13:54:30 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::f7) by DU6P191CA0062.outlook.office365.com
 (2603:10a6:10:53e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 13:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 13:54:29 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:47:20 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:28 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:54:03 +0200
Message-ID: <20251009135417.282290-10-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|DB9PR10MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: cc437fdc-97dc-4d00-81b7-08de073b5df9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ygPQzPmjrnlwRaB+hFlXtFlSWgfzAzKn7yCuu3ZXPq97AGkQAgstMLGL8+W8?=
 =?us-ascii?Q?ZZZo9Nd52YJGwTRcGvHog8ZtTdDoQpG0tZIcyM/1wcCH0PjkRSAyM4Rcir9k?=
 =?us-ascii?Q?67gMqKrLPsNaouS/JSK5Vg57nyRdGVWTlWjaoecXjjXVFTCtk4JwK6R1kWSd?=
 =?us-ascii?Q?FTYTGNa47VBfa3ee+qL8K8eWZV8eT0/L6V2DsXi6BPfdbThRFzxMcAMNDoRX?=
 =?us-ascii?Q?8OJISWsfS55oHnIkvrPPnkYsunOTvYVFhyLLRpueZqzhhf6qhArsEYSfGNmn?=
 =?us-ascii?Q?8b9wkIH27TBcVGGYkHnv+E2KqtNMWuUgcLYa10Inj727nExhrJiKpAT7FfZu?=
 =?us-ascii?Q?a6qEkFkvzr+oNx6yvu3oGqDfJO1MUEJcJ9Z2vkMLkelckYlpMaR6pC4+itZ7?=
 =?us-ascii?Q?gTYYMCb72h4j7TU+osdEOlHdJRRXrOw/dTxDUqJaTtmlAV83fPp1rthnCWXe?=
 =?us-ascii?Q?Izxt4V/DnXRy+ntB+9EN81MRQcO7FMDBWS3jTG/+Yx0H/vHtdKMY9OSaZrA2?=
 =?us-ascii?Q?7fOCykSTJ16ADYKPpI+kZ+MxIaESdc2KTa9wgD6LkHfyEmEkq1BRT6M4NCwO?=
 =?us-ascii?Q?1FbpR+nN/PbPvYXqt3M+4j2rujldb3trB/zXPlMlfGU/s/50OaDWX3JKy/oB?=
 =?us-ascii?Q?Ti9+wi3rtv7g9PlscrOGJJ53fIlot9g8marYk9GxE4wvXDqeNbVX2AGSP643?=
 =?us-ascii?Q?oIQ2wublyd6uXjy4X9/e31XMFD8To2brz2ZBWe7bdbSIGd8SjVIJONkcy7Te?=
 =?us-ascii?Q?XK8e607e2sCttBwMAxWffSiFmDNih7KNFbNGhBjCpNU8wnB4vNES+1GzeHBv?=
 =?us-ascii?Q?Sk/Qz/TxbL8htXArtmaX1a/v5dnR6uAdFQ/zfMAvQP2OuPcsR49l+B7Wrm7Z?=
 =?us-ascii?Q?2KluX9h6mYCGnIFN5a2yi8RtiTIlY4DNTRUbDYLZXbI9p0f0AG+UJu1w2HbX?=
 =?us-ascii?Q?x2FlM2GxmPJHYSntWKiOKpfsegyRVJC9xB6E9tlLJ3rNhu1qJ6tkQdguMXvh?=
 =?us-ascii?Q?ABiuGEX9vBHA+mz8Uqw2EXiqmpmx3yZkiRr/wyj78FozfWcVIopOJF+/DclF?=
 =?us-ascii?Q?RlzZqmB7JGDBX/HLgKGEWWec4j6h6SvW++coclDUJ8rsBui6b4IRIaqLe7xK?=
 =?us-ascii?Q?LymLqXjBIbYvZ1XZRFvFWO/xo5dVSxgZW/yYyUlIk/+YPRuXPz5wcleDRTri?=
 =?us-ascii?Q?TKE6zSJ+U9tY3MHkPcUUlXeRuNt0j22sVkkEZT2epOgPMfuERSTBNIa2Qygt?=
 =?us-ascii?Q?O8Y6r7BQArczRCB6ZZki0erUcXPgIuJ0626/cLoiGxIqRO97BmxYrXRs4pj6?=
 =?us-ascii?Q?zPgoce8XmL5LiUlH+utEgz6r1WjAoUGCJpFwUjS04huZ3EmjcNPop+WdjKRJ?=
 =?us-ascii?Q?rDdXbMw2czwyCKANdvu965y3EVgFNWFV6WH8V8eCJLaTY4cq7wrSdqdULlfl?=
 =?us-ascii?Q?zApL8AX7o/iQXmNpr8FZDo2s8HPLaKl+ao7fbeRCpuoU+H0sou+Vm7OVhew+?=
 =?us-ascii?Q?4SMNOdrBhqLzrNFA/xPhp6Sv+cnBsGefyvS88sdgBTG9ktAiCZxyx+fCou0B?=
 =?us-ascii?Q?3HqO2Z4i3oiabcK5oqw=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:54:29.2886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc437fdc-97dc-4d00-81b7-08de073b5df9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7954
X-Authority-Analysis: v=2.4 cv=eq3SD4pX c=1 sm=1 tr=0 ts=68e7be99 cx=c_pps
 a=+UOF+DgkhBu/Cg1ezPVRhg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 0CfZYqf_d1wGnMYKRd-xRgt8OmyVxRYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2taJO0XloRgc
 lt2UN8Dn6x3aV9W+hH8H1+f/UKz2a5WfPbd81j8ao9/pA3V4OHWPeMxirW4yVeDMBxFu8QgwkEN
 ALMFHInVmWbDc+iawkMCY1XtB8UtlRIdveHWmLkDf5LEaobMqQZO5UfTTWyY6nSvB4TXVhfLtVK
 9r3u1wiIbj/3X1e8g3lW2wKZhD1b8Q2c5cvCKjKOvcstN4FsxaGCDO4JEmWCNG+mqfrRezJ6xh9
 eBGz7xI0rDi9ZEVe+DeZy9wNZ2+tFmfxM+9o2QGHW5liGq1v/brX3PTVpdjEqrLI957+NlLkm9l
 /2F9HvmgkFhWGyEtZ2EQQNMBDAYXV9qspPTaZ+9upXmPHWlVJ6ORd7acln9HB9akk5OL91JXcCo
 hNyB2nUGQc1MJEu0O12M3edOYrsIOg==
X-Proofpoint-ORIG-GUID: 0CfZYqf_d1wGnMYKRd-xRgt8OmyVxRYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 09/11] configs: stm32mp15: Enable LED_BOOT
	for stm32mp15_defconfig
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

 configs/stm32mp15_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index b3ec3898861..c13bc1d0360 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -94,6 +94,7 @@ CONFIG_HWSPINLOCK_STM32=y
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
