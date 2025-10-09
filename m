Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CFDBC9C45
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 17:26:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD0EEC555B3;
	Thu,  9 Oct 2025 15:26:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00260C555B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 15:26:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EDUM0029874;
 Thu, 9 Oct 2025 17:26:17 +0200
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011064.outbound.protection.outlook.com
 [40.107.130.64])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv69msgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 17:26:17 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m22/tb38ajfvRJ19x4vw09ZwZpfP+EHTcZoOKBRarJDHWwB33U4a6z6tEI8K/O6dl7WxTANvRY0zIuQu/v8XcqHo6G8kylUvicjBtWCl9WXN6AXs5eL7Lys7ferH3VtcXTPxohcBn70h2PAchrXOhAgPB+G/U2QBoGI+82xV/tH4mlUWMMl3VaWgenWI6/AlXAY6vMGNXuQ/Ki20gUgm8oGkSpHSp6KbC/5GUVM6bSeeFHvT8cZYF/kYB0siJbn0/UIwL0jWpO37/NpU3oLR2LCdc8X21j2CAvoahArDlwE4zV0cCWOvMro/llAPBSl+zeZ07xq14knFaXj56v8zIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orRbDykKcpEpGjjjzf1hmSrxeSnolRRyNJixYmdBMM4=;
 b=r4cqheBw+SYDEvbWtyHNeMHbrfJF+shikJ7+rhR54vtfeLjfWP8XvCYp5wv+KmQ1A73tk+TN90lbVgv+ASz7oAIc+Y+Mb+IDuW6w4l9edDslX778adslEaFyt5Ioi4eW4mzvj5MELFcLD716S5liE0gbvA4+EaX3Z9KUSMdqZcvxq4LedQmkcKIWmL3KyGsN1SkNSmrZEE3MVib3+aIHsJ88TcbLRqRS+ksWqKcmjG0Sb59eBaL/5MoSeuFHvRNWwhntYZ9VaEl4EDPh1rcsMHg9hYaB+MXC0BCwLB43CpOPy+HYeQQnqYMkasTy/XShI649wS+NJ4k+MIDiYlcG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orRbDykKcpEpGjjjzf1hmSrxeSnolRRyNJixYmdBMM4=;
 b=mlRlKvvasjo9PB/+hdmUE+qebY4YAD0OCV2nSr2JUmDEboMCiIgYOAOUWQagjN7xOD0vrlqK7cTUhM2NLmynY+px7VDOOiFyAcfCkS120VcFlgR9ACr+yDuua1CvejUAUFhJzNLHii+vfHs3woGwb/NK2RGS9bE6aWlGQqWcFVBQ0y3m62F/qxnPK83Pu06vhxx+WLrV2nQ9iXvfqjEO1Q3d4I1Tlgi5CN9Z+eQ5fz9Ulp8LHjTzYPxzovaAs568L8JZ15WlOwM2kXNR99DyMz/ELsiiNJOEEdMv7pvm9UrJODzehJemjNBF6teofYa05f9lyyG/FVi/ss67JHVKdg==
Received: from DUZPR01CA0185.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::11) by FRWPR10MB9419.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:d10:1a4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 15:26:15 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::df) by DUZPR01CA0185.outlook.office365.com
 (2603:10a6:10:4b3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 15:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 15:26:14 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 17:23:54 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 17:26:14 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 17:25:58 +0200
Message-ID: <20251009152610.300154-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009152610.300154-1-patrice.chotard@foss.st.com>
References: <20251009152610.300154-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|FRWPR10MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 30440f16-ee61-4f3b-cba6-08de07482f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Uo4uMuCmgI1t4MOqvND27tfD+h5qI+x5HpOhaHfVnquTtzW9sJEkAQoMb5sm?=
 =?us-ascii?Q?qIs17KUC79MYxul16GvhTIsSNtuyU954lnLJc0OQgxx3SwBh6jvkIln6nrPy?=
 =?us-ascii?Q?KmWpj5tCYKGFkM0g6J+4sC/k5YD1TMC11q94Y1CSzxtCvUNvKMtrJgDC2TBK?=
 =?us-ascii?Q?S4ehc6deso3MGt7JHNL+tRarXuUhBaqldocsv/ZrPcLnatpuLt/+5xdD//5j?=
 =?us-ascii?Q?fZRo2UTc5ZzovzhxDtt8hEqgtaKDo6UZ5mKXXuQanWOCN4oVAJGyzWM+AyZ5?=
 =?us-ascii?Q?vO9k+7JCXGXztaX8JuBlIn8CDlXvgacjaacv+sVH8OVOv/CGDBW5/S6y2JQs?=
 =?us-ascii?Q?z85M3i3UvEhp8UP8zmJmmAkePhImC7jdbcCF5akuLvmS6nKG5VHBuLejuOuP?=
 =?us-ascii?Q?zYRoUFxAOPLKKcdF7s1YYhtDPMqsvQyXAPQPzXyAQExIl5DyBz5cOTAr7tWc?=
 =?us-ascii?Q?G6a9FtSQQStP5xggGxu7RWndWc95TKB28OlQMUDXwWKcyXd5vH+fnRZLKPN8?=
 =?us-ascii?Q?CyE+hnARvNk6AN7KngBXvmzJ2zsaO3VRVDb/Ku0wkbCSl5OHW9OtG4b8ZAow?=
 =?us-ascii?Q?tLmlv6+CpHBYaz8zF03TYylW5b2jBx6nvm5Exl4fMihqj4KNPALYQX/bDGPi?=
 =?us-ascii?Q?Olro4MgYwbsMbWDNdOgZjMgS4qIkDWEVnFOajNitupGN8TkCQG1CctK+/DFX?=
 =?us-ascii?Q?Cde1b1R6h5sfUvfToLWaQDzBXFyW87HcbIYR9BTBDxD8WIQPdwGvyCTtlLIX?=
 =?us-ascii?Q?5648rcZO7iK7ZUkxWQLogiH5TAyyE3uLhbKuValOTPjkPtZBhFk9+mXZpY2X?=
 =?us-ascii?Q?66zHEFaqJ7ZSYZx3T8evpxDIrYyqAg96zZt+NnPjuESXFFxPNHSrIhRwtVqt?=
 =?us-ascii?Q?cxOkXsIAs1cffSnKn1gWg/lOMM+zXvnQFVMW5CeDhiV6TpGVAJAektYp4ZKT?=
 =?us-ascii?Q?2FveHuSudtuR9/iPmooZAreTcBi3zANJVTWlKQALJc9E2lHKc3WPZn7k9efX?=
 =?us-ascii?Q?JhU0lOdbjvfCxWwQIiJz/diAbsiI64QQA32WMy+jLXbL9MU/NGZTfbdZis+A?=
 =?us-ascii?Q?Z3H+8JNyL54b71SZA4JF29KYWGKjNeDlplZcf/tEo/h931v7GEdU6b9XdUyA?=
 =?us-ascii?Q?aQfPLfYDIz4xIxXNugkuEssmCBBVMOtjVWBuhCtEqDzMx472aQ6bZqSycGXI?=
 =?us-ascii?Q?hdLX1IzgJmXpBzqw0QAFe3cX0Onj6oy1XhYkwWJ52NFnzpQzWeEYOcqfS41a?=
 =?us-ascii?Q?KTCfntUx3e5cwje0D55Cwz11p3sdiGnOkBjunSOcc7J+tFxAmjpGcKN7IwBr?=
 =?us-ascii?Q?PDH362ynGKsd9DJjuABJyu6LX7Xxl9TgJibmu0cKNlfZx92Qi7HwKMiGwfYW?=
 =?us-ascii?Q?40vphE4nD4/8mCnGTrwxOyv2Ym6VpsAELxQSairOeA3Gh3vqtfTXjCBUTgJf?=
 =?us-ascii?Q?JOLI2H1IvhchsKK16IC2eUigg74YbhZtWCLsg3ffh7aYCiX/ODEBGx4RZpRm?=
 =?us-ascii?Q?EVqRfCv/XJJi3Ip4FZSqFxGLaziXqrLLCxfdgFjWZ9rMHk0DI6JcHUmpRyS2?=
 =?us-ascii?Q?CV2qiIr8LC8APHATiPE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 15:26:14.8688 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30440f16-ee61-4f3b-cba6-08de07482f8e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9419
X-Authority-Analysis: v=2.4 cv=F4xat6hN c=1 sm=1 tr=0 ts=68e7d419 cx=c_pps
 a=4djRDh0jqsdYr3kOieHabw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=LYzleJsxAHYYEcZgwHMA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: PAGuPcXFKKXq0RAANgld9SiyPZ8Fs5eX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwlwfMdFYjtuA
 b9Y4r41iZuT/aKDDjGQBy5uelsrvordybhNzm0pkLMgiTJ8uXdlZyrR2FcmgFeu/v/WlxhF5gFn
 03GXcYBlK0qZhF4NO2gOFqZsarox2BoXKkqIfC6IwVdZK6fq1gPJdHB9M8o0taa1uhZK1NEltFz
 Os8iulu+Az8MRP939HVjQd/n2Pjnc5xyqV+h3VXjChtLaW9l9r+mKw6qbIVITr5W4qrWmfb2iAP
 GbVwnpW5GMCOMFCcflgltiNuW5k1JXpJYEKM+aHH83FPQ3/t1uVIX1ojvZj8QZzWLIPZBdKFaZy
 nqQoSWqOAMVz4jze+CFWC9qN37S/4eZV6uE0lBh5WJiD0Otgt+PPmr31NSy++DmqsTUsQYkoheb
 UQj4NoPXTlZ2+tzz/7EoAerZuNXIhA==
X-Proofpoint-GUID: PAGuPcXFKKXq0RAANgld9SiyPZ8Fs5eX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 1/3] adc: stm32mp13: add support of adc to
	stm32mp13
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

From: Olivier Moysan <olivier.moysan@foss.st.com>

Add support of STM32 ADCs to STM32MP13x. This patch introduces
stm32_adc_regspec structure, as this is already done in kernel
driver, to manage smartly the differences in register set
between STMP32MP15 and STM32MP13 ADCs.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/adc/stm32-adc-core.c |  1 +
 drivers/adc/stm32-adc.c      | 79 +++++++++++++++++++++++++++++++-----
 2 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/adc/stm32-adc-core.c b/drivers/adc/stm32-adc-core.c
index af340b8b273..3446e34fa46 100644
--- a/drivers/adc/stm32-adc-core.c
+++ b/drivers/adc/stm32-adc-core.c
@@ -200,6 +200,7 @@ err_aclk_disable:
 static const struct udevice_id stm32_adc_core_ids[] = {
 	{ .compatible = "st,stm32h7-adc-core" },
 	{ .compatible = "st,stm32mp1-adc-core" },
+	{ .compatible = "st,stm32mp13-adc-core" },
 	{}
 };
 
diff --git a/drivers/adc/stm32-adc.c b/drivers/adc/stm32-adc.c
index d50f00f1233..808c3c610f8 100644
--- a/drivers/adc/stm32-adc.c
+++ b/drivers/adc/stm32-adc.c
@@ -49,16 +49,35 @@
 /* STM32H7_ADC_SQR1 - bit fields */
 #define STM32H7_SQ1_SHIFT		6
 
+/* STM32H7_ADC_DIFSEL - bit fields */
+#define STM32H7_DIFSEL_SHIFT	0
+#define STM32H7_DIFSEL_MASK		GENMASK(19, 0)
+
 /* BOOST bit must be set on STM32H7 when ADC clock is above 20MHz */
 #define STM32H7_BOOST_CLKRATE		20000000UL
 
+/* STM32MP13 - Registers for each ADC instance */
+#define STM32MP13_ADC_DIFSEL	0xB0
+
+/* STM32MP13_ADC_CFGR specific bit fields */
+#define STM32MP13_DMAEN			BIT(0)
+#define STM32MP13_DMACFG		BIT(1)
+
+/* STM32MP13_ADC_DIFSEL - bit fields */
+#define STM32MP13_DIFSEL_SHIFT	0
+#define STM32MP13_DIFSEL_MASK	GENMASK(18, 0)
+
 #define STM32_ADC_CH_MAX		20	/* max number of channels */
 #define STM32_ADC_TIMEOUT_US		100000
 
 struct stm32_adc_cfg {
+	const struct stm32_adc_regspec	*regs;
 	unsigned int max_channels;
 	unsigned int num_bits;
 	bool has_vregready;
+	bool has_boostmode;
+	bool has_linearcal;
+	bool has_presel;
 };
 
 struct stm32_adc {
@@ -67,11 +86,30 @@ struct stm32_adc {
 	const struct stm32_adc_cfg *cfg;
 };
 
+struct stm32_adc_regs {
+	int reg;
+	int mask;
+	int shift;
+};
+
+struct stm32_adc_regspec {
+	const struct stm32_adc_regs difsel;
+};
+
+static const struct stm32_adc_regspec stm32h7_adc_regspec = {
+	.difsel = { STM32H7_ADC_DIFSEL, STM32H7_DIFSEL_MASK },
+};
+
+static const struct stm32_adc_regspec stm32mp13_adc_regspec = {
+	.difsel = { STM32MP13_ADC_DIFSEL, STM32MP13_DIFSEL_MASK },
+};
 static void stm32_adc_enter_pwr_down(struct udevice *dev)
 {
 	struct stm32_adc *adc = dev_get_priv(dev);
 
-	clrbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_BOOST);
+	if (adc->cfg->has_boostmode)
+		clrbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_BOOST);
+
 	/* Setting DEEPPWD disables ADC vreg and clears ADVREGEN */
 	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_DEEPPWD);
 }
@@ -90,8 +128,7 @@ static int stm32_adc_exit_pwr_down(struct udevice *dev)
 	/* Exit deep power down, then enable ADC voltage regulator */
 	clrbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_DEEPPWD);
 	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADVREGEN);
-
-	if (common->rate > STM32H7_BOOST_CLKRATE)
+	if (adc->cfg->has_boostmode && common->rate > STM32H7_BOOST_CLKRATE)
 		setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_BOOST);
 
 	/* Wait for startup time */
@@ -134,7 +171,7 @@ static int stm32_adc_start_channel(struct udevice *dev, int channel)
 		return ret;
 
 	/* Only use single ended channels */
-	writel(0, adc->regs + STM32H7_ADC_DIFSEL);
+	clrbits_le32(adc->regs + adc->cfg->regs->difsel.reg, adc->cfg->regs->difsel.mask);
 
 	/* Enable ADC, Poll for ADRDY to be set (after adc startup time) */
 	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADEN);
@@ -147,7 +184,8 @@ static int stm32_adc_start_channel(struct udevice *dev, int channel)
 	}
 
 	/* Preselect channels */
-	writel(uc_pdata->channel_mask, adc->regs + STM32H7_ADC_PCSEL);
+	if (adc->cfg->has_presel)
+		writel(uc_pdata->channel_mask, adc->regs + STM32H7_ADC_PCSEL);
 
 	/* Set sampling time to max value by default */
 	writel(0xffffffff, adc->regs + STM32H7_ADC_SMPR1);
@@ -156,9 +194,11 @@ static int stm32_adc_start_channel(struct udevice *dev, int channel)
 	/* Program regular sequence: chan in SQ1 & len = 0 for one channel */
 	writel(channel << STM32H7_SQ1_SHIFT, adc->regs + STM32H7_ADC_SQR1);
 
-	/* Trigger detection disabled (conversion can be launched in SW) */
-	clrbits_le32(adc->regs + STM32H7_ADC_CFGR, STM32H7_EXTEN |
-		     STM32H7_DMNGT);
+	/*
+	 * Trigger detection disabled (conversion can be launched in SW)
+	 * STM32H7_DMNGT is equivalent to STM32MP13_DMAEN & STM32MP13_DMACFG
+	 */
+	clrbits_le32(adc->regs + STM32H7_ADC_CFGR, STM32H7_EXTEN | STM32H7_DMNGT);
 	adc->active_channel = channel;
 
 	return 0;
@@ -206,7 +246,7 @@ static int stm32_adc_selfcalib(struct udevice *dev)
 {
 	struct stm32_adc *adc = dev_get_priv(dev);
 	int ret;
-	u32 val;
+	u32 val, mask;
 
 	/*
 	 * Select calibration mode:
@@ -231,7 +271,10 @@ static int stm32_adc_selfcalib(struct udevice *dev)
 	 * - Linearity calibration (needs to be done only once for single/diff)
 	 *   will run simultaneously with offset calibration.
 	 */
-	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADCALDIF | STM32H7_ADCALLIN);
+	mask = STM32H7_ADCALDIF;
+	if (adc->cfg->has_linearcal)
+		mask |= STM32H7_ADCALLIN;
+	setbits_le32(adc->regs + STM32H7_ADC_CR, mask);
 
 	/* Start calibration, then wait for completion */
 	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADCAL);
@@ -394,14 +437,28 @@ static const struct adc_ops stm32_adc_ops = {
 };
 
 static const struct stm32_adc_cfg stm32h7_adc_cfg = {
+	.regs = &stm32h7_adc_regspec,
 	.num_bits = 16,
 	.max_channels = STM32_ADC_CH_MAX,
+	.has_boostmode = true,
+	.has_linearcal = true,
+	.has_presel = true,
 };
 
 static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
+	.regs = &stm32h7_adc_regspec,
 	.num_bits = 16,
 	.max_channels = STM32_ADC_CH_MAX,
 	.has_vregready = true,
+	.has_boostmode = true,
+	.has_linearcal = true,
+	.has_presel = true,
+};
+
+static const struct stm32_adc_cfg stm32mp13_adc_cfg = {
+	.regs = &stm32mp13_adc_regspec,
+	.num_bits = 12,
+	.max_channels = STM32_ADC_CH_MAX - 1,
 };
 
 static const struct udevice_id stm32_adc_ids[] = {
@@ -409,6 +466,8 @@ static const struct udevice_id stm32_adc_ids[] = {
 	  .data = (ulong)&stm32h7_adc_cfg },
 	{ .compatible = "st,stm32mp1-adc",
 	  .data = (ulong)&stm32mp1_adc_cfg },
+	{ .compatible = "st,stm32mp13-adc",
+	  .data = (ulong)&stm32mp13_adc_cfg },
 	{}
 };
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
