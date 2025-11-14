Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A57CBC5E199
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:09:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5321FC628DA;
	Fri, 14 Nov 2025 16:09:31 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68AD8C628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:09:30 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFknXA2637379; Fri, 14 Nov 2025 17:09:28 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j3q8g-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:09:28 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wk/Fh5yeu7YdyrzvA66ENiarmV6svwCZK4vQBuJ8VxxbqQ3U99B5tkfqj5iXfY/mreYZFniv6Hw4q6fmdSWYmlDK7XV37gnNKkAnuRD1OmA1vBdO9mYlZozzwo3mc0PrTf63c3i7QYdlsotLdWCMB5KDe/vsMyKSxZ8U8lg4bMu2lFjaYnv20U1h6Q41C79Iq+eshSDnpH80RzQXiz5xCTv604VjQUCxVddy5qCgWWuoLrU28w8b/e0NTEYpJ2zkGO8NLmjh1HgraPlf0UPa1bR/m0eQ91x4fi8k+4i+YMK8S20wQiwpkcez5b/XuWHhocpCnDR3ZNNmQpfxp3G01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmqnMdLVvofgsaW5pbR6XVJcnUZzd7g4GlAnTTvNUpA=;
 b=a8Kv9tQu/7HijFvX345ZJr9haL06KSr13IQhcTxlFHBLAoXF5tv06LqhBNv4Khg0e/KO9o5yaE8V7nMNOo63bN2OgrVPo+3D94BdAPh/i7S39u7hdg8MBMYC2/xUpDK88gZTf7p5mcpdNHSHOgjeJwDXJTJom9SHFFIjFGbvLccfJSFgyZGflnJNLyiqEfwFmNwyPLmkbJpbJ4R+2Q6nPNi1OgFA1r5qN22wRvoc3bgXq+6CY1l0Jhq0j13XzmyAlQYOQ7ALKRQICSWA3gA6+WL/0vGoH8A2Om0x7lUmsekDBb18oiPM2DXCeRopR0DYXRHDNuDe5fleYdU6mbMU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmqnMdLVvofgsaW5pbR6XVJcnUZzd7g4GlAnTTvNUpA=;
 b=eRU7cC53dh23Nj8rv03cX2OTCH1T2R05OSX5VOpUGBTj1HGoxTxRWo1NxYjgggoWcdGgnCkvI4+pnF5ez8EMg2VuK1CJI7YHZ20y7mlEjzXTV9yF3f69O9+Ok05XUOibnyO1FVUtibI74FHXO6EWOmwGOwW/GmEIwEpZWLhsNDVQrgSwNcuF+4hP3CQxuR8MSjppGOzp/lXXlhu2gAkRxuyYgGH/Z3a4mnzsaGPWpGsUZEv8pJ0V+HgYAGlKR4gqZOdmue6RK6Jn/vJ0/jyzVZj3JEC5T/CcR+hAJsEf7ihWLlmqWq96BuH+cNsstNcryQQ/TWlU/oAMdRtOuLDLWQ==
Received: from AM9P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::23)
 by DB9PR10MB7956.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:305::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:09:25 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::29) by AM9P195CA0018.outlook.office365.com
 (2603:10a6:20b:21f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Fri,
 14 Nov 2025 16:09:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:09:24 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:09:35 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:09:24 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:08:52 +0100
Message-ID: <20251114160916.4051853-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114160916.4051853-1-patrice.chotard@foss.st.com>
References: <20251114160916.4051853-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|DB9PR10MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c794827-8304-4a23-2002-08de23982e2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nwvSGkH8hRixBLpqerE+/Csf5rzBo1+cz7qG8E5o04Tb/41bLjtv/i+8mFWK?=
 =?us-ascii?Q?RdjJoIfIExJ58gCyzzfalA6oWq042ecUevgYjeHrXupyNZ9FdDkGEiFbKFly?=
 =?us-ascii?Q?F1zCYAoPezHeeGq2timj3u+/mOk15k/UQRSzrC5syWdU1AxAlzNsQppx3tye?=
 =?us-ascii?Q?Cw4xgtakzFUdmZH4A34cRcKCjprrIUQeJw7mcTHDEr38VTYO2nWnRFSwcJKP?=
 =?us-ascii?Q?dJJSGF39vQjfL+bP/CB+IAdloYME/RHjvl6IAKlsMMO+q24Oexc/vpIcj32+?=
 =?us-ascii?Q?IUXNXEUSDKhRC/bB9IyI8lw9hy9LrpNmsXU4O7p85nZ01WBKqPUHognTDSje?=
 =?us-ascii?Q?3NVK11kycT1d0vJGYG0C6aBVzBiTPoJmtebzz1JP+3bM4DiDcl4pW4o0WrHc?=
 =?us-ascii?Q?sAdt+LJtPH2N3O+dzLoAHHwxU3XySghjQKLg5BNYLdjT7/nmCLndssWNrmin?=
 =?us-ascii?Q?m+OoWF0xUNMFlpj8zCunaD5mVH1TItux9YGMxqQWLAkzKqvvUt/NahT/3WNx?=
 =?us-ascii?Q?tLQbOT1pVGqu22qO6cQDCc40ZiFwmFHCMqbCFFf/ggPouII5bIW9aDzsjxLm?=
 =?us-ascii?Q?TPkex9/1HIUTgqK9vqOfyiyzAbwkBh4P5rhI5LaemCkKuAiHfp45cbfkLpaf?=
 =?us-ascii?Q?MW1weaZ0u5CMMZQicvAb8KImM44baqplLOkplct980vrmU2qHrfKTA0sZfmQ?=
 =?us-ascii?Q?KuczMTLszTTFiaF/hRpaKRTsssiWlC6RauvxAucL3dUgSpymrXC/gLkPstmM?=
 =?us-ascii?Q?7WAk/4qtMBRcbthTyoCxQUB1YmvgQPA9CIfWbpphoL9D9fc8spiilDGF02xh?=
 =?us-ascii?Q?OjZthybA2JhuRk4YwBMeftoj13Xk2nXnlmDbw/MEW+6xcg2O4JDWmd907ErJ?=
 =?us-ascii?Q?YRY9etN784dp8lnriO3ebxWYP2vMw62ZEsicYp3venTAP2Vzl2dgoKTDkQPR?=
 =?us-ascii?Q?KONL7UQQy8mkHnVNx2qBgBsJC+dz+OoXeHn+KSvOVZmSXHzEMM+cijEcFgmr?=
 =?us-ascii?Q?cjn1+k97Iq4Y2zIByBlhb7e31EoI3jcZojqSuBtZFURpqTwK5LMNJH5i6Uit?=
 =?us-ascii?Q?tn/pnJWzV+3ytsWaKM+Py3wYdLqHlwSECk57J/9X4c72dX0syliAaKsamkiX?=
 =?us-ascii?Q?aX/+tMquNss5HqtQi3WhEr2NLrRwI+7XqHqbFRU4YHCT5P0hlG2kRuR1oe8H?=
 =?us-ascii?Q?HHi1s1ggjnpY3/8hhKPi13oYhhERWRq7IFfgMU1L1sAADazES/fPdbb884vJ?=
 =?us-ascii?Q?hVP/RrXFSP/Fl6WfUyr5QbGRnJUFc7EsPtB/m+PZ59fNhksWIWCk+ta8P5Wp?=
 =?us-ascii?Q?FEtlJ/BeXAgjrYw0Qn8w+fmrhVAekknZm65LbfRiH2I4YelE0FFhL3eZb7Wr?=
 =?us-ascii?Q?qp4xdKNDW0ANnKcymtvpW78fsejHm1+EW3P7ZyJacQk0u11wzFdHbVw/HAMN?=
 =?us-ascii?Q?TwzitpzAHtbQDu1aF5eQGACcYJaDVaTS9UvnJTpYsPy425xms84Esi0BmBQB?=
 =?us-ascii?Q?MOJilGF1TuqSzIUsjiuWDFVI1WGFWTWkSembISkE8mTzcHESkbccbyXfDW2g?=
 =?us-ascii?Q?v1t3P10Tp05NWo+MZaY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:09:24.9063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c794827-8304-4a23-2002-08de23982e2c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7956
X-Proofpoint-ORIG-GUID: 7YbOZRm2p5gfwofO008FOd3F4Xxr7bDJ
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=69175438 cx=c_pps
 a=TMP85qg2SDlybNPwPaJQ5w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=LYzleJsxAHYYEcZgwHMA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMCBTYWx0ZWRfX5YPzdzXpORsL
 moTJg2rLesvFup04PTVUa89hCtrq5iGUUSpv6l3MQSoRAX5TvF6KZd6B7evXQ2La9GbeoUAMmBk
 chRMf+FWGhe4o0qs5yMEMWRRPgd2SpMLmR8uTsg1nx4cNJZxSJBsjt4R+fZpbIGW2WZpHKV+Vud
 8iiTe6aOTL5YQ0Fa8losbk3TyVsE2VYvr6ai92uP+aTPPpWTYzBGIJMPfkIhWqYAbCg7YfyZxrx
 Kg9ZJGXqB00cfnA2xLp6K3CM+1I4LOYoaBYSemWLZDmgf521eLwg//mctC3UFC3lR/pW8uE5kHB
 uNKZu+oDE09VpPmIHDwlcdNJ6WaCh/j9wlUuQc6IHoWE1c9MEBhqCUILe7eM2N54+QL0muxtA4R
 axTtaYOptdwAGfLz9O98JDuBs1D6Vg==
X-Proofpoint-GUID: 7YbOZRm2p5gfwofO008FOd3F4Xxr7bDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140130
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v2 1/3] adc: stm32mp13: add support of adc to
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
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 drivers/adc/stm32-adc-core.c |  1 +
 drivers/adc/stm32-adc.c      | 88 ++++++++++++++++++++++++++++++------
 2 files changed, 75 insertions(+), 14 deletions(-)

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
index d50f00f1233..b11f771b71c 100644
--- a/drivers/adc/stm32-adc.c
+++ b/drivers/adc/stm32-adc.c
@@ -49,29 +49,68 @@
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
 
+struct stm32_adc {
+	void __iomem *regs;
+	int active_channel;
+	const struct stm32_adc_cfg *cfg;
+};
+
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
 struct stm32_adc_cfg {
+	const struct stm32_adc_regspec *regs;
 	unsigned int max_channels;
 	unsigned int num_bits;
 	bool has_vregready;
+	bool has_boostmode;
+	bool has_linearcal;
+	bool has_presel;
 };
 
-struct stm32_adc {
-	void __iomem *regs;
-	int active_channel;
-	const struct stm32_adc_cfg *cfg;
+static const struct stm32_adc_regspec stm32h7_adc_regspec = {
+	.difsel = { STM32H7_ADC_DIFSEL, STM32H7_DIFSEL_MASK },
+};
+
+static const struct stm32_adc_regspec stm32mp13_adc_regspec = {
+	.difsel = { STM32MP13_ADC_DIFSEL, STM32MP13_DIFSEL_MASK },
 };
 
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
@@ -90,8 +129,7 @@ static int stm32_adc_exit_pwr_down(struct udevice *dev)
 	/* Exit deep power down, then enable ADC voltage regulator */
 	clrbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_DEEPPWD);
 	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADVREGEN);
-
-	if (common->rate > STM32H7_BOOST_CLKRATE)
+	if (adc->cfg->has_boostmode && common->rate > STM32H7_BOOST_CLKRATE)
 		setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_BOOST);
 
 	/* Wait for startup time */
@@ -134,7 +172,7 @@ static int stm32_adc_start_channel(struct udevice *dev, int channel)
 		return ret;
 
 	/* Only use single ended channels */
-	writel(0, adc->regs + STM32H7_ADC_DIFSEL);
+	clrbits_le32(adc->regs + adc->cfg->regs->difsel.reg, adc->cfg->regs->difsel.mask);
 
 	/* Enable ADC, Poll for ADRDY to be set (after adc startup time) */
 	setbits_le32(adc->regs + STM32H7_ADC_CR, STM32H7_ADEN);
@@ -147,7 +185,8 @@ static int stm32_adc_start_channel(struct udevice *dev, int channel)
 	}
 
 	/* Preselect channels */
-	writel(uc_pdata->channel_mask, adc->regs + STM32H7_ADC_PCSEL);
+	if (adc->cfg->has_presel)
+		writel(uc_pdata->channel_mask, adc->regs + STM32H7_ADC_PCSEL);
 
 	/* Set sampling time to max value by default */
 	writel(0xffffffff, adc->regs + STM32H7_ADC_SMPR1);
@@ -156,9 +195,11 @@ static int stm32_adc_start_channel(struct udevice *dev, int channel)
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
@@ -206,7 +247,7 @@ static int stm32_adc_selfcalib(struct udevice *dev)
 {
 	struct stm32_adc *adc = dev_get_priv(dev);
 	int ret;
-	u32 val;
+	u32 val, mask;
 
 	/*
 	 * Select calibration mode:
@@ -231,7 +272,10 @@ static int stm32_adc_selfcalib(struct udevice *dev)
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
@@ -394,14 +438,28 @@ static const struct adc_ops stm32_adc_ops = {
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
@@ -409,6 +467,8 @@ static const struct udevice_id stm32_adc_ids[] = {
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
