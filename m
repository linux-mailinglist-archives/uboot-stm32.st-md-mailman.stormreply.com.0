Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C04BE88F9
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 14:19:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A592C58D7E;
	Fri, 17 Oct 2025 12:19:10 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E3ADC36B10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:19:08 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HAfq1w014757;
 Fri, 17 Oct 2025 14:19:06 +0200
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011064.outbound.protection.outlook.com
 [40.107.130.64])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49r26jkp7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:19:06 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYe/7bvUUPx+O9awr1h+N8sGKuYfY9Z4YfPBv0iMhQDsXGmQQGfjLDaYu+JtFdTRQoo6jcTCZixq9xyNeFArmS7AIaJzO4igxLS0FOdHymWHcVFxWX5SMr778lVLqhUhAfpiJiy5uqcVII8mXYFgBdLOhGD+RdhVpWXsdt1SiSSrESaPRtpvj0oS0TF8rraA1B3i5gR31id1X6CatPbWUngrCd77kRodB1wxyHeO/iG2W2QDh1zAnIyqhWB2VqdfId3wm0AuiwYRZTdF4QJ8nGlPuxRwM9zV34Eu+2A1IV9WmbDHQXS7JWcpeqyGccKx9uP/ZXTmVl0Rl0ByGU94iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXGGubYOKn2+B3USpeAgve0P2SxY0tGWHyyFjw66VGQ=;
 b=Z1zb1qzU1Bftu8r38SioCiqnXIan1QaQ5nYDuJYiiE1mFjapLzfZ7zOe+eJ47/Tv9P4IzRkSR/Rod4cXbdd+YanQ/CdD/Lo2x391jEQOqfUk16IZdAREpSVlRk4d7zuaT/E0dO678Iq0wawHFtpe+//Oq0hqpfZswWn1N7EUDXcAHALhpzPgE8OkB5xcdRdSWdFfhd8FRMNvu+pyw4cYVg+KQRAFdiLoDjZ4I4K28lrHEGxahNugcyO8v+f840n75eeMGs0KiePd5SQenXLJlQ50cbI20LN1UJwFnizvq43/Hiszug7cpuhwy/b0J6e497/jgSnBClYO925NvmJ5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.41) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXGGubYOKn2+B3USpeAgve0P2SxY0tGWHyyFjw66VGQ=;
 b=cjm0izEetv8ZM4SZaoGjJ2m1oLhLd2OchNA2CRoKClu4hnKhRe5aefB1eiP3MXyRBBs9WZXhPEWMYdoZdF8Va/2qgmImu6P2M3dhrjvJ+o3TT4WHVDeD/AlWYv1Ue77qh7L0taAG+koeubrKcx1MmfUgbF3PZRArzu763k2WPBBt3LAX6IGjx3JN5FJEQJlPlarC9wrOZXbhKUzug80ItIIEVI+Jh03lTPerD0i04J0EAxHTe241qGpO1QCoD0VX8WLOmC4P3x7jGyuNcBW47mRZ1QBIWzY8V1fuwkFQSbc6uhp80KHlnecE6cII6QGoXnUMasAYh476kxD0Ko3JfA==
Received: from DB9PR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::30) by AS8PR10MB7301.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:617::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 12:19:04 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::10) by DB9PR01CA0025.outlook.office365.com
 (2603:10a6:10:1d8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 12:19:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.41)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.41; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.41) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Fri, 17 Oct 2025 12:19:02 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:22:15 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:19:01 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 14:18:39 +0200
Message-ID: <20251017121852.109561-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017121852.109561-1-patrice.chotard@foss.st.com>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C5:EE_|AS8PR10MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: e5142a4b-006c-48c6-fbe8-08de0d775ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?evJ/g5/4a1CS5D5JfmTMeNw6lFfQLQUslsOn1lKz5jV3Bo6iWW9xRuWJ4scJ?=
 =?us-ascii?Q?LMGD80R0uOpxfQ0HXdZNKfKzHAP/EE0KdLx3RxajQ/OlWhdPPZcl0oh4xz8c?=
 =?us-ascii?Q?e8kzUlCplbixQJJhWny7Ce5zJ3m31wJn6Zw5hDkBQ4WuqIuIkFIDuTNnw9Kx?=
 =?us-ascii?Q?U/yxuq/MugaJQKT+HmgwxIf63/HwdPPZtLQYV2a0wmHsfci/SE8A5RFA4m7A?=
 =?us-ascii?Q?4w1AOsSKSaYGO6eHpkF4tMsf+ve7IYTCjH3oKAzqUrv8aQS0f4pZF0huGpem?=
 =?us-ascii?Q?YXq9gGObh8YimMpTmEhephkIaU2ShOMQUSglRkh0wiuvUSrwoZIzWD5Kcrvl?=
 =?us-ascii?Q?Jn8iEptkglLu+NxMBcL25SHyiX6TtPsMZ4lfrSXu9CchIcHFkBupJtqKeD6J?=
 =?us-ascii?Q?UYzCnG4ZzASOBTUjXILykCt4+kFsmmaPazIUQLfoFODGxQqfJiLcNPDJAlF8?=
 =?us-ascii?Q?+n3/PS/jMvlyNvB/DU8qt2hFHx0nbsUb2Sphh12S5QaqVe2tB7JkzL+DNX4U?=
 =?us-ascii?Q?FsfHkSKkqF07dzNHMAmRQKdIu3a6kW1wEJvmoogb+57tDtSkUA/LQIehj9Hq?=
 =?us-ascii?Q?FZurvCUkmTl1l20nXxOoUN0ImtJpPnbbsBLV0tWvBtnVmRMVViaK670e3ccZ?=
 =?us-ascii?Q?6ASq/u1UWZKJQQP/Vhkh9PnErB/+HHPT7fUld7EpavT3G3NFyTtZdUNqMCN3?=
 =?us-ascii?Q?78Pddqm5CHxoIqIdjO4tkmXuq+HNBfWat+tlpExGc7LFXCHpP4aqwh35N3bM?=
 =?us-ascii?Q?k02vMhe+yV4OxmICvE3oA58cunZmepOLFFIYLjKo4dGxiSqyvlzy7XdAFK6T?=
 =?us-ascii?Q?h/EXu+HGoDp2xSrAoB4oXHWwZbcQYUr2tKuAqMfXAgB+cDU6hdcGerQmCRBa?=
 =?us-ascii?Q?6vyZNEoFcBve/oUX5A/awhDDxmHsdwHJKlshIAm8iVhkVbXzc5iiOSSazLdu?=
 =?us-ascii?Q?tBP4j5+hSMY14hUQ/XJ59ZzSoazKXXWnrRzs+s/pSKUYdf/Fd4zOyWEfRusU?=
 =?us-ascii?Q?xRgiyiyubKdEWPsUqfU3uiu0fs8pYZ/PKofTkFgguPoTMbPnhfz1M8Zz3D4P?=
 =?us-ascii?Q?Bhk7UDEnY1PnbCIHfvKfJxNN7yWUU6upTbiSZX/MPZCynpoAhhx8m042vv4r?=
 =?us-ascii?Q?XiONUSJpZCsH4juyfHtrfRE+eFZ2df8u0GA0Yq1sd5VwIll6MggPL5FqNBHY?=
 =?us-ascii?Q?a9q1dN88X5+8a+W7UQvfIGYt3SChyj5kCXHt9xY4dpYazJnJSkZe5n59OdNm?=
 =?us-ascii?Q?b1+EsWhXLwdhvjlPVmiAnN0WfxJCOv1NGLwbka1SMbxhAKIKiACNyemsLUup?=
 =?us-ascii?Q?j9dWfzmzk8Ear+AzM008IxWGH9jw158OkV5ZdPDm4G6gNiWwbGG/Ip2UYm1X?=
 =?us-ascii?Q?vT41CSwBYASnpigFyq2rF+IkyMD5LCmxAhBUFoe7sWtHI1R+kFJlKSpl6+Yt?=
 =?us-ascii?Q?vCM+3eBXrfPE5vc5RFPtoEbAfS8CowgkEWCtcYhMMbmENfYNRW4GGuShrA6d?=
 =?us-ascii?Q?Zb4/HIcwy8cf+Ks75d1+LRmF9BTL13AYZyXg9eLD7jGQeE+9gp6PcV5+UXcB?=
 =?us-ascii?Q?MKRsrMxF3oJQn1eZVdU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.41; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:19:02.1719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5142a4b-006c-48c6-fbe8-08de0d775ba5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.41];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7301
X-Proofpoint-ORIG-GUID: aQ0y3ZemIRbvG3mzKVY-dAOWoOAH-Edi
X-Proofpoint-GUID: aQ0y3ZemIRbvG3mzKVY-dAOWoOAH-Edi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDAwMiBTYWx0ZWRfXyEwi9qOJ7ZoY
 JgdAyuZd8wHwWV3PAgJ2eJW3Q8kNoh1VNKPxc93nubA6HpBQtvSVKSN994iChCaAHEFloRRLKMb
 FWfIXkSsbs3aS38ikpuoQoOqhtG/RQBGLxOHcXY5C41sTYWlzuMIibGu4ZykEHrkDvy4Q4hhNks
 0PXjBmp4TzjHd9xSdBgkKRMytv+gg3xjKV2vTCQ5t8ijHKq3QDZQgZNWSoH51tBovVy7kF3WqNV
 9LV8TNYv4Xmr7plCOPOHWJ/CZ6e2KJ2ZsUkDjovTnEenaORiJ/Zu25TYmzhRMiDEwcPQNu8ul37
 ipeAwvWXPhiHtfqjJCnvszqi5Mnn0zfdkg559KZK6BYmoG4b4pK5cc4Ms4AIVLSjrlixSY110x1
 4LV7BkiYZhiaMBkfaSLDF/15OVxq3w==
X-Authority-Analysis: v=2.4 cv=X5Vf6WTe c=1 sm=1 tr=0 ts=68f2343a cx=c_pps
 a=4djRDh0jqsdYr3kOieHabw==:117 a=k+92ZC+kR50ztVuylSZIGA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8
 a=aimzZ1Xja1RZsTo6zB0A:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120002
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 2/5] ARM: dts: Fix "arm,
	smc-id" value for stm32mp23-u-boot.dtsi
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

OP-TEE "arm,smc-id" is equal to 0xbc000000 but kernel DT has been
upstream with an incorrect value.
Fix it temporarily until kernel DT is fixed.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp23-u-boot.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/dts/stm32mp23-u-boot.dtsi b/arch/arm/dts/stm32mp23-u-boot.dtsi
index 872a8739c54..5a9436dd193 100644
--- a/arch/arm/dts/stm32mp23-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp23-u-boot.dtsi
@@ -37,6 +37,11 @@
 	soc@0 {
 		bootph-all;
 	};
+
+	/* temporary until kernel DT update */
+	watchdog {
+		arm,smc-id = <0xbc000000>;
+	};
 };
 
 &bsec {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
