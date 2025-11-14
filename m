Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78792C5DF40
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 16:44:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40BCEC628DB;
	Fri, 14 Nov 2025 15:44:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E06CDC628DD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 15:44:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEFiCEZ2608971; Fri, 14 Nov 2025 16:44:16 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbrjf-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 16:44:16 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FusaYOd8Hsikle2z83tGJfa/fVWj49hF6IUvut9qP+TYyqOlRTOlx20G1/v74hbqba2nRON8iLzx2Uw9F5KjrZg9E9fCx+nQe2h/VyokZQmpiL4weS49ou53dG/DtQJwfAUTrsczbFAHvrz3QoXfkMcawIAAdeLH9uTXRrkVIPBdqi3/u5+k7w4rXfRZnGtEQg7SBQPfXwr/g2PJ4Oviqg/l3kgB7CrPjpUmfB4MUAmSlBecKguObKsICyzL7kvM4Wj+AQoRqrVrw+RjKwwhaT+iQH9UgAy4ajpOBQ3frcD1oTcKEfL312IwSbcdeuGEl8w1fUAcRsulQajW4pHFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKdgZJL+QCOUPOnwXi4rTHTjtOrrnIuNWQuJnpMIYAA=;
 b=P7NvKFXaLCHb0XMRnWCqZLMwt52MddQLXCIbxRS//g0ld39jsw6C1Rd91mwmzqbfuaF9Qt2dD0ZGXJrhiIMoseeC8Vg2hWXf8YyN9kxL7W9gTpcmvufyZBlS+W7QIPjsf4hKkN4+z43Mp+M2hqLkiNjnAlHRiXmHgkp+gsLrko0jk1rkj1AAS9sTiIZzA+xILc7/20fvZ9dCzEl6SuvZY6wwlMnG4y2XFulwVCxRZgPkoa5H01aYPW/vFb8Vfg3dyQ0sjxb9HZOXOIM7UyLF8LmFWAbgb6stlFs0In9fEoIPKAWhIfgPcPTeObUTvGGrkZ4ueaD/GMr500R9a+3DWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKdgZJL+QCOUPOnwXi4rTHTjtOrrnIuNWQuJnpMIYAA=;
 b=PBiltSPtnDMdnw4u/TsyQdDpIiAn61GrdAqWbCn7o2HRE8ACcnYO8cFTnX821xlMfQ1/xyyIjzCg6cP7eDuq5tNYtCemvHbfQ58GztTXmRS51Aj0tvAIv3NJOazChNPZaN1sXs6zuxiAGoHyR8kpk5u7qtX4ciC8tHVzXmVDM49JSGqUZ8lo81A92HbbQGnlHskxWpPlS4AB0BXfT2/AQbFDQL5QCky2pBLZwmXmzLkTfdo6R86IcZGtqaNWB0EY67Ne+o8F5ntxzN8PDBO+XdXjlen80aGh1H3Q+BgT7ZAhCRg1sXqGBr6vLaEFSerfjA1bgeVMsoRvBe2efTNMGA==
Received: from AM0PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:208:14::32)
 by GV1PR10MB8633.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:44:11 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::78) by AM0PR03CA0019.outlook.office365.com
 (2603:10a6:208:14::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 15:44:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 15:44:11 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:23 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:44:11 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 16:41:54 +0100
Message-ID: <20251114154259.4035206-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
References: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|GV1PR10MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a04e2cb-4113-4024-4638-08de2394a83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vz2bR51LgaLvq282G64kJDozuFp1c+yM3cWqPunMVC+jwKr9wb65aJaoxnNu?=
 =?us-ascii?Q?wGD0hz5clHWPZ0hgUugQXaBG8O0ZI5xeRXvRRVIjMYodQaipn0uiJJYuEST6?=
 =?us-ascii?Q?7U+dQMDhOvFwCZ9jgtm9WfJgiicqEDUESHnSmL56DGY69r7wmzViu2r0KkLo?=
 =?us-ascii?Q?kLaiRGhaOC9phyWgJEkzBes3+J18StoABMVDj5iZcODSNyznv1dFczMnbDHB?=
 =?us-ascii?Q?eD1rbqh7Vr4Rw8buzJrcYE41x0XxG5ansmIUO+2B63W5ixs2j07Ju5bsNId4?=
 =?us-ascii?Q?SMzRhJvuHS6S1GQW09nwaCw3jRrkjEKdiSIrijMYwhSq98LL6Ai4dc06zmC2?=
 =?us-ascii?Q?ekeq/Ir9OodQ3ewjGv99zLFrk5AN2jw2Db7BLI0vumE+xKMo5DHWk9XcPCjG?=
 =?us-ascii?Q?ftirCHVNxAtyXmH2Xv1olK50do7+U+0QLz3ka+7FeuP5q3otC+wzaiTD2kb8?=
 =?us-ascii?Q?yPyoMIZmqzF4Msp+uBXwxMPWa0xFUp0bAAMarCENKCRErflVaqW8BZtNzd0k?=
 =?us-ascii?Q?RW88jtZ0q1LXN8ubIGLZMvUcuCH+GfxmZqDEOrhGB9cUY8/BZfJQcuwSmZ5H?=
 =?us-ascii?Q?azheoRMFAyf5W+5XOmeCyeexuq2kZdAqoaEmWhpGOrXx18UeiMDvjqbLFt/b?=
 =?us-ascii?Q?FjhOSUdZfYdDTX2xgiQRuB+3GfwqR6JkBLK6la6CPKVbwRT13rqIa81+QdQd?=
 =?us-ascii?Q?+KW9YI6Zch2wOEVDkt8d1anznLl0CWqwDXIq3V9ss7A59HPCRAlgsEOfZi1E?=
 =?us-ascii?Q?VnA0b0Rx/YE2RN6XKBAI0i9fxWulkSpb6ZUKMx8GtMrv/eDAUclrHC2/X3jP?=
 =?us-ascii?Q?CHSg9kYyKKu6SDUtGNoHY4OOaQQWg68syQMeqkuId1VTCkFds2EDgJSxL4l/?=
 =?us-ascii?Q?xuR+4A3vwcdy86Zi6ja7dmOf6qfXKqTRNDbS4QXuHNI0Px0G0phXizpZN3Vw?=
 =?us-ascii?Q?Q16F236oYSdbe10uaRBIi5iFTeMqw8f3cMjyhJ0O6rtPsgg2PHWCZ1ppdWq2?=
 =?us-ascii?Q?PHjjaGOjX33nxulSN5JwfHjZrLV0nE1gFZfs9EqtTEXEZgSd0Cp6v9A0M2p6?=
 =?us-ascii?Q?riUdsYioDkV/GKTAeu8+CnIZa3gcCMImwzoVXjHAU/6oUhYE4JjS+BpXSRFJ?=
 =?us-ascii?Q?yA+s7dxoUp1y8JRicUgtAGfQAj6yqDCE5uCDPwsT3VzfMwtrvgRdVc3Z5div?=
 =?us-ascii?Q?BjY7RTAjJFeGGFxUPz0B+5BP0gm5xwZcXHP4+AbI08UKfnY0T0SaLb7AImEJ?=
 =?us-ascii?Q?yCt+HI40wjLELBRDfwb39Faa1jrC2xvNuRL+BWQN78VjZWloGq854wHdMtio?=
 =?us-ascii?Q?QsC2oV9t4vtJp1/eWP7+qckMLjuljJxzUcasNcpWhE2W4ixdsX/8FVXCF6lE?=
 =?us-ascii?Q?QVvnY83gXVNim89DrFq06G5buWiuBn3iPrt7why2DAskVx+9KVsLC9MhxasQ?=
 =?us-ascii?Q?yBw4Y1ClF59hrjPS852sQCVIZ+owiYjMNOBzaCCmDr/O43JvTMxYmzu/5Nnd?=
 =?us-ascii?Q?HYNQnwXGvZJDkhc1FSbakt/cDyj+TAoLbSDntKMMrKyso2bIX6CCEbtpUzKk?=
 =?us-ascii?Q?EHNhDD4vBRynVZSB6KA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:44:11.6942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a04e2cb-4113-4024-4638-08de2394a83a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8633
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEyNiBTYWx0ZWRfX1U/tFGZLrN7X
 6N5CBKHYr5kp94rNXWqo3GYfPP4/i3rKYxbAvsL+xXvqRQ3nrRm1QV47kIMzvqHxmSPBEb06u6D
 rp+T7D9LfFfkYww3jTrgEdrLpP5kH+LbH0dA+DwJxMPx/qxfpbQMR3f6bJnbAlmU0ALziy+mOE0
 n6R61ogfpxeHySH47SnASt2IUwPWeS6asMHsfCm4DoffxXwF6SDGUVt88Uas7Cu/UGutk0wdSI2
 RVl1aOKQ6RwP856CORAo68OtR3Sfz6M9B3Mwtbfq3Tf/qB+52EtdagtOEYvzJCxPOFQ3Jgn2YzU
 ZRQCfvLlS385eVMbnXmEUxkEi5cXx+XpN5WwzV+Sof9vFCpOkNlzYb108GweG6STiUtDjp7mJ9C
 0EyWoeqPsXiuq1kDj7xJDPVQ+nmq5Q==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=69174e50 cx=c_pps
 a=7NAaTQ08Iu+netfH3uu5eA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=b3CbU_ItAAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=yC-0_ovQAAAA:8 a=qgGfcE379voliFx8wEoA:9
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=uCSXFHLys93vLW5PjgO_:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: H_59Zl7vCBzEbchqWQ6BDtzwJRFh1Tyr
X-Proofpoint-GUID: H_59Zl7vCBzEbchqWQ6BDtzwJRFh1Tyr
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
Subject: [Uboot-stm32] [PATCH 6/6] configs: stm32mp25: Enable
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

 configs/stm32mp25_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index a5ee02a09b4..3959ed8c017 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -57,6 +57,7 @@ CONFIG_NO_NET=y
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
