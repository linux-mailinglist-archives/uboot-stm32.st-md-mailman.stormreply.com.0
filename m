Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4B2C5DF41
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 16:44:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CF04C628DE;
	Fri, 14 Nov 2025 15:44:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EBDCC628DD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:44:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFZFQY2592120; Fri, 14 Nov 2025 16:44:15 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013061.outbound.protection.outlook.com
 [52.101.83.61])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbrjc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 16:44:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPaZ8I3h0UZodxlx8KyyzITcOyVt9Rx+Hi2td5Ct+4I1RzJepIIhfBchItkXlAn6xkmsWCQ+KNFovz37oniET3LAsaKdt2wbQoIkpiedEf/SFIf0WQZ/N2F7wsL1jieEWjMZpVC/UPkVzO7A6J8jdp38RuxeVDj1mNy1s+LlA6cE6AO6UNDLJieD0w/5BWCeNiuvvDWngfp9VyOgsEFpfjbHovZmtsd0aGqBvn0az754PfzmlF2Dr3ZjySANrqReqcrCp0SF72ZBm8BSOcaaupNmyq9kpmwMy43tw7JxgY1j1bIICtZ6qgqfYDM+QZifsR4E51rT8m5zr6ADVvdc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cop+40hrqne5cN85M66lomOmsJnN0rVt5qd2fM5VkK0=;
 b=Rpbo73FiTrYz7oFORJzg4Ny6EIBLPf91LasxsBV3js1X6qxzCof2ZRakT3BqT0Cxaqy7IEsVtyc6f5KfF5qC2n4LFQY2EiC2ZKbEe/94LVNDrPge43m0FMVs/nABJkg/KREooOAabnH26OBw5aEFHbn75axMd9iCrW6qqTupY8xMOuVK0gHahWZ5hHeuRGqIn5dEl2bZReARCtZwNpUWXfoGzTXeGLki/sRtvPRHpYseGAjzQuJec/WGXoE+55dW1N5I915R6+4q48cgvPfVgK7SR3QKVchHBGazAn3GVOvcw8FtthI+2/NBjklkIFmxavLNlyFqxWNDS/b1eLU2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cop+40hrqne5cN85M66lomOmsJnN0rVt5qd2fM5VkK0=;
 b=kkY4hR5/TUfvcQlO+ViAv57BF2ByUJ+4nnOBBus0bbIaPmmw8OucFrN/C+e2UvupBlvS5Ks7fKgF+yodR8MViY7COb6R308s0cz1BF5OKwA5ZnSmI923W3RBudE/aT4bQ7A1LDm3xNNvrl1Ez4vXAfoCtrJZXaxY4dSl/O7CowJ6KaErqGZCDjV0U//GXEPOGdamZyMRiQaQyCamunXfgyL1kJ2iuPfwamLSkXt0S4Kzi7PUILu3YEeFkWbIZsHSrarEK7Uy9fu6RWJUVXyf2XZDywT/U7kcE0dX3ZLQUJ1dUKYxDYW3sy/fhRZukwXWsk2Uh+k6hBn+RWhM/0AnsQ==
Received: from DUZPR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::12) by PR3PR10MB3931.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:40::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 15:44:12 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::b4) by DUZPR01CA0010.outlook.office365.com
 (2603:10a6:10:3c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 15:44:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 15:44:12 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:21 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:10 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 16:41:53 +0100
Message-ID: <20251114154259.4035206-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
References: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61B:EE_|PR3PR10MB3931:EE_
X-MS-Office365-Filtering-Correlation-Id: e5bf25f5-bae8-4d8d-540e-08de2394a876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vt4BTSklqF1KRPvPIjhRbdPxvMPBqXf+2Af8eGf1Kmzux137s2sqIWiOOj85?=
 =?us-ascii?Q?QrNlNVXHsM/aAtTfZuIA8KcrYyd3wK2ZefYzYCTA3NiH//UTuHsKYdveXKjS?=
 =?us-ascii?Q?ij5b3MBZ+fDvK+m5MyO3JdtCM7w4gzBm/z+dDLCb/wcYYi8N2q6AZdMHOtm6?=
 =?us-ascii?Q?nNB542qsplEAIYfvmO1cLtfUdtWrVtk4MtJFIOeahgFv54k5EcqfoE/s67dM?=
 =?us-ascii?Q?hkLIvpPmGT6NM/9kAbbG4yWXp1LlFZs80K5RBsecX1OMwWy+kRJTrq+QGB4c?=
 =?us-ascii?Q?qg1yb42MhGTFToAPr4NZc6T3ktYR3kFCES1K9waTuikNTRpNr2bay9vDeUr2?=
 =?us-ascii?Q?JOHQt4Zrr7zfIYDYmBb6lrUJAM3f9kdZHO+8DdeyHmBQvewCihuZQB8rkicA?=
 =?us-ascii?Q?eNb7HpwExdURJnRbHUa5BE8yiROjx1GfBJ9z8zXLfU2rJ47wxOP9+BEOwd32?=
 =?us-ascii?Q?YLtHdf+2ip3+gbT6zPd3JnfB5aJH0sxszhxXwSqECRGV9ZM0i6AiOTPLDM/d?=
 =?us-ascii?Q?Pt5DMUFIWcCgkOJBqoIsKjgveEWcVfAMv1hfCcRZYNJO8ryyn4L2UP/6rKQU?=
 =?us-ascii?Q?siNewXhQDZJ8pBfYZn4MC/tAo8KNtLbPYZelv18P0VIowM1aCrikHqVWcHO7?=
 =?us-ascii?Q?GJCr4qF6XyaGHh2PiIvhqDMnBSEHR4i64yzJzjf8u5uWNnkaZmaMQf/nBlWV?=
 =?us-ascii?Q?2JRD+WZ5x2s1iuIels3KDH9ajoeKgST0QhN1uTEjReAovBP3nj4cpwxjO/e2?=
 =?us-ascii?Q?8RAu2gm9YjD6zdTfyH+eYcxacNZvjy+WE9kRFvGoDzgdEmP8/rk+mFtv6MiR?=
 =?us-ascii?Q?SFgFEubdKMVj4ai/hTSrGEooFyKRbDPyuqFebdzdx1LNBrHw7pKzSq5zkl3+?=
 =?us-ascii?Q?eOWFNdzVkOkwlRgFydeeCWbaVjMoHmHLskiPqALanhpialC0sUdNlXUZmLjB?=
 =?us-ascii?Q?3P8RFkAcfpOw46b+ugCUyvQhAkLWIkdUHHCGworq9tgh+dOR5UrWsGW74gVt?=
 =?us-ascii?Q?OnY0oi9oSq3l02njzFj7TksR2F5Rl2EssRR4fnqDGbngpX4vYHWoz4QsVoEF?=
 =?us-ascii?Q?9MrBOB0lSOLi0A6SB6CJUK0j2JfDMrS99oHvakbVfrbvY5cb/W24MzOUi8rF?=
 =?us-ascii?Q?DepNOil/nKNl0tIjRHw+L/PkzO6tis/b36QHsC8bIUKx7peZQ94Bymr3mb6d?=
 =?us-ascii?Q?/vnNzIZcszmY94qkZfP4Iwfu40zyA/Bxqup6jN+Ms9m2Nk/IHyFu4rfR/57n?=
 =?us-ascii?Q?wbYyJFbkU8op+9149DYYylcZgIQ349GY5CVQBvBGyrLtkyj9OiwH3xyp42xx?=
 =?us-ascii?Q?BA32LKF9y0tNduHmBGjvx1WlARC3cIa3cTqBY4QknSaaS8OGwrdgKCFK8oc/?=
 =?us-ascii?Q?Rxnv5Atc8nJsC/vRGYjymu0T4Y7rfFrdRJ9SLhdtanBgxDpm1dvXrhGLaYP7?=
 =?us-ascii?Q?/TlpOM/o+YUJ1/e95UPSYwsU1rHwYTX1TBWrdRslsS85HKVS9KSmsmW9td/T?=
 =?us-ascii?Q?t8SNquj4T9drFJpSV7OcRheQSjoWJ0lsSca7JEB4oUGUixSUWo3xNKkibDWH?=
 =?us-ascii?Q?yUuafi8JXujCtHtWOTs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:44:12.0449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bf25f5-bae8-4d8d-540e-08de2394a876
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3931
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyNiBTYWx0ZWRfX/HoZ+N3dA6Zp
 9tsrSQI9BjTXS+om+5lWiFwD8K9CTONzNzhSENhlThPBaVvBxrD674maCfCouZ/i6BRIaA3YMdU
 SMvhR/dBLtQQnmsz0f194bju1/AHMQCRbQk9qgMeIb0XTi2xL/RNpiVU+4PIwUXLn4CGrzV8p+Y
 AnaLsLqelilxIscTKc40Be0A/imUBmw6QTWxYk0NCUKhBCRgTznLP4lVehFtd7oplrrlaGWBKm+
 DIYEtDv7eEVq7OvsXx+UP7s/ohMRzWYKHhEHZ0gBxsIDrtKnZBFZVouMmAIeSdIoup/gQZ3kDt/
 vCMtYAEcUr895PzyEuNXzfYSDnmvm7gI0m5miHFWJN3ZltCGJHknURKN41H4VWR27hw1mCpnUZB
 e7iibqbwKai/jDeUnbBx2LsJzj8CdA==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=69174e4f cx=c_pps
 a=SFnEEDVIqCIKf/pgzgechQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=yC-0_ovQAAAA:8 a=qgGfcE379voliFx8wEoA:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=uCSXFHLys93vLW5PjgO_:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 7Sgmgweem97ndnjTe7KOIp3xRgDaextA
X-Proofpoint-GUID: 7Sgmgweem97ndnjTe7KOIp3xRgDaextA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140126
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Valentin
 Caron <valentin.caron@foss.st.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
 Alice Guo <alice.guo@nxp.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 5/6] configs: stm32mp23: Enable
	CLK_SCMI_FORCE_ATTRIBUTE
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

Enable CLK_SCMI_FORCE_ATTRIBUTE to register parent clock with their
real name during scmi_clk_probe().

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Cc: Alice Guo <alice.guo@nxp.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Valentin Caron <valentin.caron@foss.st.com>
Cc: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Cc: u-boot@lists.denx.de
---

 configs/stm32mp23_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp23_defconfig b/configs/stm32mp23_defconfig
index 840855c23e5..7901cd678d9 100644
--- a/configs/stm32mp23_defconfig
+++ b/configs/stm32mp23_defconfig
@@ -51,6 +51,7 @@ CONFIG_NO_NET=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_BUTTON=y
 CONFIG_BUTTON_GPIO=y
+CONFIG_CLK_SCMI_FORCE_ATTRIBUTE=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
