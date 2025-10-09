Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73083BC9636
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 15:54:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35DFFC555B2;
	Thu,  9 Oct 2025 13:54:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13A66C555B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 13:54:58 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599DmOkR017102;
 Thu, 9 Oct 2025 15:54:33 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6fmcdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 15:54:33 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRu5BlNplt4v3FlU/rPv6u8I4dun9uuXkao7Nk8033V15+DW7zkds9ktwqZJj6xaG1UlsXcKdRNiO41PPILIt9g6JuC6TzMTaAIYgKPTGkxlxuL/5b+xE2RIn2LVJqPks6lc25A+O2MEGixXP3MO946VSpdIIFJPMdsnQ5yBEvQvKD6+qk8kOMYnn+j3n9+gBXPdh19S4btqXF2FbcWFiNMkDTDKVVvJgb2K6f1k7q/u3ohahypzwXHi8x706NETZkmZ1cqxxVaEMA6fcY+LUlXKpHNeM2d+5NKD/+KiwAmL4IrVru3B1qRrHmi1ILIMj26GHX4HMOLp0h4fuzHPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi/UIYWk44wwUUQV9ai35/5aOcGJ8o4jcKZz4kpL3yo=;
 b=qf9MuOzr2ILApNZDD69IIg9Cgiii6YyyAA1TppKWCNF/J1/gLYppA572Np9NiictblIeEPAqmYT01ax+6uDTHuSJUJrlIajaPklJo82OH8Zv2QooETOsof5FJKfI4AIzxMGN4IBgTVB0UA3mqCoDsjiAFm5kjbMGWenEpKP3XJ8O8rKUBjjVlYdrrIgmRE0FMbRueyjdwkFlO5jA4HnMXBE1W/8KXs2dnatK2CE4R3VyNWEc/KNnePx2lnZB8E04jN0Wr+H2tFlfDCgw00WXx/M/3tzKjLy0in/S2fUDo2978fqPiFftHcvEP6mv67Y4ycXJ67KB62tg1mBtyUc2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi/UIYWk44wwUUQV9ai35/5aOcGJ8o4jcKZz4kpL3yo=;
 b=SrjMnEGiKY7WxSFRj8eaNXc2XvKaHBKc3VUVXf19kfX2zRaYpA0U5QZ/3cmItUQDtrR0teBmOMd7rcMiuiELIiTaoe2e86i5tONDqYgGuYNb0me7pTdgAEplnolXmCRQQI+R8e1fFV+CkyCnIIE+Y7QkvjUpoOib+yUv6lpHIkbuo+7JbVp1len7JgtNfC8R+pLYyXl6JhW1XbrdSAlQJNMW0nHaL1l7ZER3VujeX57k1LQIIs+adDsIGnD2EIXtaUIRE1WJbOkf6LIerRZe7+RHhosjUqDQZ11SrKVxNuwxZmYi0wvHKyxBCEZ7/ULxpdGRZMzDAvtwEaRPLgQ56Q==
Received: from DUZP191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::13)
 by DB4PR10MB7422.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 13:54:31 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::94) by DUZP191CA0039.outlook.office365.com
 (2603:10a6:10:4f8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 13:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 13:54:31 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:47:22 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:30 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:54:05 +0200
Message-ID: <20251009135417.282290-12-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009526:EE_|DB4PR10MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: fad2dccb-6edf-4805-d220-08de073b5f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7nskpj4P4iGeeJth9ux3wa2dMTqKz3NPTsefS54qKk+BAdcWKAQadKpBXEzW?=
 =?us-ascii?Q?vqmKZXv4HXKxc4hCtA96uzpqJ2uRj7ivxGyZRX7XU9Fyx79GzuFqgrkZXwXT?=
 =?us-ascii?Q?0OVYP6f2HDu++0yaEIvIHVt7aUUcKIdYLnLegkPT0XrgveH3UvBDSZ9Q0PjU?=
 =?us-ascii?Q?+vG9RTQlVy/49XWRSbzGn64oXV2htPoYIktN/sc0fCFYXweKcYzZIgO363K0?=
 =?us-ascii?Q?WLHlOg38bhQqsNHsmCIeWIi8zwYe3o4dxWpt2vDPvNwQMDpBrPUVyyOOC5Zw?=
 =?us-ascii?Q?a02yUsfFw7vrc9vLDSqd2tNTmBK2AEfsvBkpsaZcvo1YpbkZenJTJIVWrFl9?=
 =?us-ascii?Q?DZ4d5ibVltvAYP7gRHyO/r8861pNBt9/y05VR+PA1JIMzGaMr8eAKxf/zlMC?=
 =?us-ascii?Q?oArq5o1JEDOC+j6yqBw9UwZmP9tpSVGoP1jaGRFkW5AYSY67kwvds8I1ANbF?=
 =?us-ascii?Q?g0J5Rcp2cFIWZ+BgKO/032EsNnnIF9/rmCdwuLLBaIY0XSU5hm+TZsrNpIWu?=
 =?us-ascii?Q?yMaOr/E2if5O8ccpcKZknCjSG+EXHDzGT2iALfZo03nZ2jrQymLjq6DJZnOb?=
 =?us-ascii?Q?+Xs5ZyqbYPyTtmAhM7ku0ysxXM3CTlHslJn/hUWr88jt8e3mY0vYOHorayqz?=
 =?us-ascii?Q?6xaT/5Uq8BEdn62GutmoXOlGZ4m4DVhcvWfxYsdtiIv9IkLksk/3tMAqWTjZ?=
 =?us-ascii?Q?qpNo2/1l1dTJdjr2DylLL6N9F0k4cAjFPWxTZX0zfnTYteZA7oDvvIbRz8q1?=
 =?us-ascii?Q?pyKXg8RaOr0BEe87MG0/t0V97eUS5yPKIJJ0PPePV5nTbZIXlk/xvOH9JOKo?=
 =?us-ascii?Q?SJNAUgb0H02haAk2nwbY3JUl+G5ukCu2DvHdxBAq5gHGn9zJJkKvmrr2Hg5l?=
 =?us-ascii?Q?+ftnP6X8E1jCe9lyJFNk+fN9UBw5wj9PynSCVaVp3L26VGYcHr7ebKG9nuhn?=
 =?us-ascii?Q?oaBR7afOBmS6xRuIZrYNGaMVZvKNsaSc4oK9IRaSxztPaWS/w01n+ws8e3JK?=
 =?us-ascii?Q?jxE/4UJntj3dPcHIjvzT10+aMMQ77J8n3q6mN+3CgcME1vdbcpjtQRI1ihRw?=
 =?us-ascii?Q?nWi6McMo6F7LWavAPK0Z+IxlHmxBtFJkex9gn5JLcz+SRZAXm2TqtBw84YGB?=
 =?us-ascii?Q?s0H4ek9Anna7RHi1PkP2MguXU5YE76ACAKfHhxZfv70ygY2dDPNw56utG+ew?=
 =?us-ascii?Q?04oyKe0u4+ieALhcwaEXva2ysYZb2YkHS/DxMniJ6GISqtSucmQXioBtSARY?=
 =?us-ascii?Q?5aJDWcUjW1o/ymaEpZpH+6HLlPy8QjiooYXRsZvbHTxJFYEC+ce4CLCSpMsl?=
 =?us-ascii?Q?xAclX+GWDV50NnvbFPm+cLstAp9+6h3UMcl97GQ/yTSUCqNyFxRO8A775LFV?=
 =?us-ascii?Q?A98skpIyak5uqTc3fubvPYG+QLJlRJdFwCLOiwKWrObNTyeSbqGLpvuoicCU?=
 =?us-ascii?Q?TndLYxgnngBm3RX9gkbs6jZxS1OyQoeo32Iku2/dRsYDckream3qwFJr1t8O?=
 =?us-ascii?Q?ufjF+/8W4eKk0FDsxmlbTxaIA0/NxxufZrJ+ywnxzZWTnjAHIMcQDXFgQGFm?=
 =?us-ascii?Q?v1zKa+BMaO/+sQK6n1s=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:54:31.0790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fad2dccb-6edf-4805-d220-08de073b5f06
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7422
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX1SqQy5gwxxKw
 nlGBwTzSbT2r8UywqVNIeCA6KWpuLcdifI7Lk+zYSq9HrlMCZc7H7XZP+/bczpDm6SYeg7Kcb+n
 iEePmePRIfUfRI8DJEtX9AhXpPwfdXO6H+M6bjEDIMEwgOTBQMOIEort6QUqu2l0l8lGZIpYqMg
 UTFTldTdVxKJwcmT99wuLaJULKm81s/6CgYQ8HwfBKZ3mKY0FFvsdzh10V6fn/+XNSiPmWpiPbm
 nYa73tv7JEkfG/SdOLReNrsSpIcFxN8ACRe/OZptGCV0YnRnwEDS/End/arq3A/lGxFnkSlwXYJ
 56/xQFuNpkwJVl8+jg2QBJMADLbZ4osDUAzrgPFMAUr5JxKe58IvJXCvKxu+5Rdp0gsXbaQJkJW
 nUsW8WAO6lcqAwV6YVr8JAJtNZGaUw==
X-Authority-Analysis: v=2.4 cv=aMn9aL9m c=1 sm=1 tr=0 ts=68e7be99 cx=c_pps
 a=RmHue97ipze0icY0clRZTA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=SxxZRTMbgU000sIlMgoA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: _0LSigdDRuQBDd-6noj7fdhCQA4bneEV
X-Proofpoint-GUID: _0LSigdDRuQBDd-6noj7fdhCQA4bneEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 11/11] configs: stm32mp15: Enable LED_BOOT
	for stm32mp15_trusted_defconfig
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

 configs/stm32mp15_trusted_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 09383ed4824..77684c0e8c9 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -95,6 +95,7 @@ CONFIG_HWSPINLOCK_STM32=y
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
