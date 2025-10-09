Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BDBC961E
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 15:54:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E92D7C555B5;
	Thu,  9 Oct 2025 13:54:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA422C555B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 13:54:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Dl7O6016221;
 Thu, 9 Oct 2025 15:54:29 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv6cm90c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 15:54:29 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbyUp/NJvjXBUN7MKYF+Md3zAe6Aulvnov0N/UhXobpXt1Zf2wDus1+QLeeTWTHCbSCExyTq4hpuPK0XYNGYaBKHYC+tYQF5JyhpaYYQiMP9wtL74uf4AwGr/OpbzdKY/3hCczQBVyta4QreKSFMrSqEh2fj9D6epQ8XoWbTLUL2lzwDk4+zUs2ibx4gXkqRRf6YKt1Y7SP1a3/nvDlsgAI6rdNc5LH/3Dpzrp2RwJxsg+cbYJZQPaycRNbMu7XTucnGtOU69OUf8qQyoZx+swQ1rXXXg9izFkQr/xhCwgXSnKSHp6RoeXuc9EVpI0PiCebcbuDEfmjfd6DXom4OUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J330jm5R3rRYQw3nbTtiCqFweoj/dvW0Ch2P8ISCNLI=;
 b=a4ZSGBX/WjbUW2qSWrIrI5sCjmgavQ+A0TLQXekJ+uHb3gDV3uH56IyZnwgrtFWCBlkgCScfKmxJgW89IWEdAmhFVBS24g0REISFGQjsbl4C+kYMigEDgZrQ/G3NtNt5xPZc2wg7ZGIP6unOWMVX/csPCtk5sGeGIckd9wIP/hsUvDxgH4RKRAKJMJWASoJHE6ocLr27zzp2kH02GCoJ70+bTxkqwcWgpCjtgG3LHrksbz/g5DgKbr+EpmHsw/IwD1wfDUGY3hD7P67PoJxNTOKehANLqctL1O6lQgYEYwdKfWCz7i0MHhJFccKIGlyvw3cGmILV3EvrtT7H3a0QiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J330jm5R3rRYQw3nbTtiCqFweoj/dvW0Ch2P8ISCNLI=;
 b=Zdb9HTFLf9ezteOaB2/pR3eAUeKBR3DHjMBLCUZm3S0YUcGIpbG1gLna5g703BqdK46kHpItEhPBbRd39kkKHwlaslDv/NcIqKQpT66CdO5/QTrw3/mLI4Bxj28RijkcL80TMbp7+r/mVmZ2PtlFVp8+0Z7B4JAoTJ6LYP2jMuhK3MVs/5p4NuupgJwdCo7xS4kMZ24PgsFtBE57qcZp/INGmPv4IHvistpFnMZvPHceKFQig12OSInXvZKVEKnBxsOXApZiXA6pJOac6J3/bMR0N2UBiuAUkm4K03Qr/7uxkOPTqAVcJa75BEbZhH2H/t2pWqOgtGgbvzwpHtO3uQ==
Received: from DB9PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:1d9::14)
 by GVXPR10MB8583.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1dc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 13:54:24 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::d6) by DB9PR02CA0009.outlook.office365.com
 (2603:10a6:10:1d9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 13:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 13:54:23 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:47:15 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:23 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:53:57 +0200
Message-ID: <20251009135417.282290-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|GVXPR10MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: cb460c1f-6cd4-49c9-e589-08de073b5ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QLHKdYlwZN2J3S9GPfWcoKkS37v8eMVn0HTKWwn26Udn7N9qAqFULRaQOOJ7?=
 =?us-ascii?Q?ci6xdyxWmwVPZgC2exyVWHBUXffv7EJ83mqrEzzMrOaoW7l33zjlqY8nFTgB?=
 =?us-ascii?Q?vFwnZN1m8fnw3sI0DE4p+6cFPcvvm65O0MvagTFmEv8bH18IBD8YyCJ2jlzr?=
 =?us-ascii?Q?f58VUKJIiELJNcrHFdkcPLV1u37SHgIvIVpj3TN+sqNQ6p/ePAdUJIKuVTfB?=
 =?us-ascii?Q?lQ26o4ZjQCkSGQMIH+nMKu4IZgP47qIXdcnEtfbN5kTtws8cu89QfJVd3znx?=
 =?us-ascii?Q?Jp6GBs1arcynqrfyoNKtRuFm+Zg1oCPnUvOH7B7+j3D8XaL7oBhKThmjC7X/?=
 =?us-ascii?Q?wLAgwYPusyK0SrZoG/1WIgCAQhvECPg5SwJyzwo4IucR+qIkFyBe8zsgUymU?=
 =?us-ascii?Q?Zx4y1v7kpX+Ivkh4+HKWmvCaF0VlJOAOhdXmp/5zPRDqvtM+We2oRCy3tvLx?=
 =?us-ascii?Q?tR2RiNW0JzsGol3CKUYbhL7tSwpT/OuSGL8uFSrY1LPCYkeM+fIWkVWKTqhC?=
 =?us-ascii?Q?YaUWO/AVnMcdtjg/lN+J32Yt8XxD0yBVQNf2YNvXEEHBq9Ad2KRZvX+AR4hh?=
 =?us-ascii?Q?Eh9eCe4zESUeliRUr/00rg91u114dJU24YdjaGdiGbIDvBA34Ne72wUUEo9U?=
 =?us-ascii?Q?ylscz36lE89mz7QtdSIgHjkmgtqT0CTrnaH8jpM5koy4XeEdStLyiFFkXZis?=
 =?us-ascii?Q?HIRx/8m0tMfDYoFDLWt7EY7A5DO0lSCxdlvXYEmcl+U7Y0KDVUWatg1HDyjs?=
 =?us-ascii?Q?JC14H5Rl6kVT1FmLRMk3s8/iVsGXojJlleBuCUzUYIKOsK42+IYBrIqbctVu?=
 =?us-ascii?Q?EDcoKVO5WM+k2mhxangW4GztKF4GvmfVt6W8ACoN/NRbpYCxMJ2t6IQp2qOJ?=
 =?us-ascii?Q?UnxfVVKLmuBTfb+upIKDSBXTQR6Bzxe8/sSWbMv3B9lDaTo1PpQeCMvFUVD5?=
 =?us-ascii?Q?MheWYO5k9SAwaRU16YX0t0anGuucK5x8HuMRzrCV9aTb3pYLMYp/86CZ7oBY?=
 =?us-ascii?Q?UpfcBUL4dRU5o5My2rplnGEr0fnpvlPgUPJhiyhBqSxICFh1m/FjAExwriHg?=
 =?us-ascii?Q?1GNbFQX6NQgMaiGm+7Eyn9HvyMstvx8lbx9pI0S0WihomxTnv+6U3bmpmul4?=
 =?us-ascii?Q?LuHSCd8lMxowH0W6fniRYFnPl/mPP6c1loQujOODDZ7hL7fHDqQZOeU1Fanz?=
 =?us-ascii?Q?dBGi4BaLEGJ9TJ8NpjRaSzJAXq+2t32AVwCYwk/jmXFT6Qq+iHbg6pOfvLdw?=
 =?us-ascii?Q?lL8EA+fsgfKQo1qokaMnJLdRxTQiMJsuTvOIKrQsa1KVaoztG2rLaENvDAER?=
 =?us-ascii?Q?RVSzxIKY8GJ8nI26LkHylTkjuHjkCuoknT1dIvngnRvT68srP8SpK8Cd/sEs?=
 =?us-ascii?Q?0Chiwm7gmH7Ej+5qkeMjoYFcmxoFox4swnI1SP0LbIucNAuoGHsKG0xGCMQu?=
 =?us-ascii?Q?W8IXVGGC7uUVO9v6RkrtBxkOH+h8gkdWYETlZmjMcj1DLF2P8s23Y5i9sb9q?=
 =?us-ascii?Q?sYFHQ9cpFS1yDO0f1OY72VPlhNypvPwxQd8sSW3LeXt8xceP6WPIXtBVwMG5?=
 =?us-ascii?Q?gxkyxK2TMHWu5ObSS2g=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:54:23.8409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb460c1f-6cd4-49c9-e589-08de073b5ab6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8583
X-Authority-Analysis: v=2.4 cv=eq3SD4pX c=1 sm=1 tr=0 ts=68e7be95 cx=c_pps
 a=VxSy00vce0v/PY9HbWMykg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8
 a=tJMFnUTR484bbKKl0DsA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: QNp5E74kC7WPp8Brj6vWRE_1Po1EPk7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4tZNzeaOJlHT
 an3Ui2S+N5+GMWQfWxt8kGNwUyuOPQYdDuoLdPcf90uPvsoa1yjXT9YZ5xwA5LNerdo+bSW2AuH
 YgJoJZljEpD5o4kAUZ/Nc++RMDpu8tLSQxud6zDbveaGCu5i7EOWc83YcoyRW48O4ZQB5xXsywj
 vw7brJ+VMsTF1Knnwlgt4hzcoHnX7lB4ev9jBSwekfMY6VvlqSu1vFjHKA9yGz0j8u4QC5iL1jx
 etxwPeQFXBvEERaxrf0m2aPQEjAcrCA2lAxPPiRdX0i0PQ30Ae/Mb300ZoFVrt+vrhylpQh0SoZ
 amntGdo7LwQwnEu/ukdVZGbXmIxquKXbf98haoTRv6OZ6/8krSatXImj7xnq1EknfOE1ydsc5EZ
 eNmHP/R3iCpa+xapvajFEiJlUNq1EA==
X-Proofpoint-ORIG-GUID: QNp5E74kC7WPp8Brj6vWRE_1Po1EPk7t
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
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 03/11] ARM: dts: Update config node for
	stm32mp135f-dk-u-boot
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

Remove u-boot,error-led property as it's the legacy LED stuff.
Use /options/u-boot to configure LED device as described here [1].

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/options/u-boot.yaml

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
index f004e9840a2..a9c575319c5 100644
--- a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
@@ -11,11 +11,16 @@
 	};
 
 	config {
-		u-boot,boot-led = "led-blue";
-		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 
+	options {
+		u-boot {
+			compatible = "u-boot,config";
+			boot-led = <&led_blue>;
+		};
+	};
+
 	gpio-keys {
 		button-user-1 {
 			label = "User-1";
@@ -30,7 +35,7 @@
 	};
 
 	leds {
-		led-blue {
+		led_blue: led-blue {
 			/delete-property/default-state;
 		};
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
