Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBEDC5E33E
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBB35C62D38;
	Fri, 14 Nov 2025 16:24:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF125C62D4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGMcZx2699776; Fri, 14 Nov 2025 17:24:44 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7m3rnu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:43 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIdlCuIgazmpfYPKyjeuK4sTdlYzGA/q+Ke+3L39t/Vx3OgQYCTKDJlQhzHBh77ei0FOqO1IbpxP35akSy3ma9PX2LGIMiANpLokTqWbmrvrdaITJxuVgOfRxyuh5yrzT+HQSv/K/eF6MKWwM4M/n1jlfo1IfK3A3UkzzHPHJsYUxDSQlkxPmsjceAuoTAdVMZanrtBiUip4zPxXnhkvwDRokcjdWkJbU6yQlaxkI8Wgom8WZnH/0NATdaB3d4VOJGMI8EZImy7wEsjPfJwYe8d1wlew1V25aL3XeqctLnfYAmZAy7ILGHOdQUIp4J9kVFlrwbzc+8w/8Mc9RSVFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dxg3uAPlFfK9hDJZQizEd4bj3tBk1fJQUTo2uPTfHY=;
 b=RuAXn59ge6o2wFQiFSNqlYoUZlAuHD73yBXUDYwmw9ZgK4ZJu9oTPueH0ZycV7tybVY1c69ePBgKl865B3bpLwkeRr8P7SPCdb9x1JHzSyr8z0FTy+a1cVi7vtAnk7gJtfAIHZ+qgrIEymSSqbnoPIPPNGGOnIyQBVFs+CdWXt9hVOhqgno139/pUzOGTu2r0kq78Rcc6uVRrh3dT8GrUp40G0oCgYcRd7NbgNpXELgV3BBaA08PPtldc77FL4+NlK5p7u/cgoPJKWnWLtZapKeSAop+I0GRhwPZZLk6bzP7oQIf9E2c7C9xyzRoWcmOCfgXzeZK+h0nnmYISFEwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dxg3uAPlFfK9hDJZQizEd4bj3tBk1fJQUTo2uPTfHY=;
 b=Gym/WnTlIgb3yCrDm+68T/D5EOIDsVc1VJyFEzI8jq380Imq2oH7RWpvpjLX5M+hTby7pIJhWPVbiN1PZb7FYlFrxDppWI9gR596kKMhg69v32mBCFMBhkeLfjzUH9sbciEITrErHZQkViESIfBcD1AOBzqxBmbQiyQ2ATV7THi4qAhLFEaB0MxmbZKEqQU3cOK9v/O+ApQ6Mh8zjazku38r2OJnzB3TCK2c+1YO9dcQNtq5q0Pr0q7v+PBUvq3BKGOD8pJcKfIHZ2PkqetFiRQRoPzynJtiHdCXPM1DRrLVMQks7lPv8FgL6+zDDce5S2n3Yic+DcUHMwmdJd5x6w==
Received: from DU7P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::21)
 by AS8PR10MB6819.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:40 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::91) by DU7P191CA0021.outlook.office365.com
 (2603:10a6:10:54e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:38 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:49 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:38 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:54 +0100
Message-ID: <20251114162417.4054006-21-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|AS8PR10MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: cb14cff5-1c1e-49d1-bba8-08de239a4f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/b3cf+p6DKgXCD1sKfBPOw8Tfh9TFlEZnk+nZYlwb0vH1fF+IdG/Ydb5p0oN?=
 =?us-ascii?Q?SjztJI2iu0lBPjl/pWXsf3KX15RIyN1n84OE/Gi9th6rJkOYY5AY7mH4TuBH?=
 =?us-ascii?Q?DSTvX8UPQzJKBpLzc8D+a8D+NFUXE1vPpgOGKTI0AFWx7RiCsy0NBsrUxn13?=
 =?us-ascii?Q?saw2IIkxPBUnTQdAcZek4U8oVb5SAvB+Swxi08Bm94ZsSSavB5poOpR2AwfL?=
 =?us-ascii?Q?xMxbUhp5OUZ2PPb/+KUoyRgKDUEDL3TA/G91ndkF3s1PACoSyZmvNoQ5Cd9G?=
 =?us-ascii?Q?LTwWQJbH4XBePUjT1+2TbhMetPOFOB+TYM3qVyMnConGXJLqvDQdhdUsfBb3?=
 =?us-ascii?Q?n6UZAdy8DWSRSQfQR2JFOUdXGOExdO59bOmpSR4F1HnHelX78jzd58y4g4Y/?=
 =?us-ascii?Q?OJH1FHUwIhlRNxhwWpA7kuyd/9eSYv77sxlCt3uSvo6lOrS4AVIjiOja1oo4?=
 =?us-ascii?Q?sZTmzwkdlAoz/CDWPYb1XK2kfpfkcRHMwU7rQ0ejo1AnGFSHQEKm/3NF2f67?=
 =?us-ascii?Q?Mm0OESMNAEv1eIi19zqPw44UpsYtvywU8zGe3RPREvCsAG7hjuCMx5MZyFT4?=
 =?us-ascii?Q?IUs29OGCT/uNTZz/BFEoqhykvMk/aeio14Wi3aO62OjGIMNV+Aq462ra2p0r?=
 =?us-ascii?Q?Q4ZKDJ9kyWuYhhuyrTcu2TK+zUraNPKwGkIRgamXapzOLgKRqA8CaquqX5Na?=
 =?us-ascii?Q?KSJlJSlLBD7M5o+NTptagy6zDXas7ULQNodtY2sABtt5M4wGPJ3Jn66kG5Ec?=
 =?us-ascii?Q?VXhMUVXf/+lwZ4m3d8inThL2kFdUCyyYa7Wmi+U7oF3hshgJLX3BA96M0pbu?=
 =?us-ascii?Q?Ke36SX6HImh66Ewb9osM5fAuZS26mm69TgWG/OO1fAsY4kA8YBN1CvVvNX57?=
 =?us-ascii?Q?apDEODa75dQH8VyEWd+1GVAifP0YcCRDf6cFZsEcNxp92zV429k+3PGJND4K?=
 =?us-ascii?Q?Zb/k5JKMrLAzX3Waj67oLfUAUMBskAhPQtx9u97S2lXbW6TfnYtrYcgyZGz1?=
 =?us-ascii?Q?YegHgnP7JbjAD+zoBh6cEaj0FO+ffEsWJUWGqP0dJSKfddHarG+gN2O4zMkX?=
 =?us-ascii?Q?suhUVxH+Qa8NCdHAAqneBI3s5pZGbOXPsoFl08qvCZpHpZf23OHYWRZ6YrnT?=
 =?us-ascii?Q?PWrKoTUqQHY2Q59n7FFGsIoa5m9M/NKvD5BIdYPMwZ2Xaq9P2d9j4sfg3kk9?=
 =?us-ascii?Q?CvYXXuPAsuVL0d+rdBuT6chrTxCVpy5t4lakJMNCUOscuv2g2EmNn8Z560y+?=
 =?us-ascii?Q?u2dDPkiJ9Y5h4qIPVz+/DuMFV3bpCSd9cKpQWRonRhi6oaDNiNBoaVHLqY9R?=
 =?us-ascii?Q?+KIm0RucvS80IjQ+InbZOJh+WgjqoPbyUYlM4S0OUqJC476Xn0r3RG+KvIDd?=
 =?us-ascii?Q?Fiwtwr3Xr/XmAUfJOE01qVmBHm+TdYT/uKOZGIJ/LfzVwF78u3ph3h/KSjPR?=
 =?us-ascii?Q?lYDbeSXyI4fCIxzA/QUXF/VHSIBzSLsRR1MW7P0SenE5qovPJAKEdQq9R2eM?=
 =?us-ascii?Q?aY9wwZp1vesLWm2sPjhkM4NB9vmpS9aeUtmRGXdUVYRqy88ByBf8bBAL92VD?=
 =?us-ascii?Q?JBegQfdNu5YSbcrFsko=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:38.9497 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb14cff5-1c1e-49d1-bba8-08de239a4f01
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6819
X-Authority-Analysis: v=2.4 cv=AZK83nXG c=1 sm=1 tr=0 ts=691757cb cx=c_pps
 a=hWbABYry04NJwfsCYjdnpg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=CmysW3ZjGFxj-qsZjvEA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: ngSvKwO3iSlIaHVsY3Pi5Vl3sfp96DRB
X-Proofpoint-GUID: ngSvKwO3iSlIaHVsY3Pi5Vl3sfp96DRB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfXx4DRzabxpXxB
 9VyXY05HOnkVn11vSV2VYfZw4uNpczKjGF/ho3tMWjyO8IU9K40ZXhaNvdKoFlZ/YP0sw0GsieO
 szTftcWhCuu20wn1+Ci72EBJJZx5su8o78v9cn8KaIwsM+xRkcidpL1AwJ6Uq9E8s3CB2/8XNnK
 EFqTyHd8oGNNTi0Zc80vmS9KLb0q21H/5kCQOGUDIJCRR9xx/GllVoMwfRaPqbOy2l1a9XxA1Du
 awDJ6OLZfpzT4/cJi+JVHtJK2bxLD5fDcvP+CPudZG1ucQl9D8UuOX5VLq6YSxeY8WdRPSLTuly
 2SmnNB9TZ1cno1jAImltqaAZ21OQuUxeb9PuQS9NzGNNccXT8m1AsAy3mQXI8nWiVw/YlQ4yodS
 d6bN5SBuVNZv/6SMdWr/iHdBw00mbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 20/23] ARM: dts: stm32: Drop "u-boot-led" and
	"error-led" from stm32mp157c-ed1-scmi-u-boot
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

Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
from stm32mp157c-ed1-scmi-u-boot.dtsi.

Remove led-red and led-blue nodes which are available in kernel DT.
See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
index a0f034b008e..ca1342b80f9 100644
--- a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
@@ -12,8 +12,6 @@
 	};
 
 	config {
-		u-boot,boot-led = "led-blue";
-		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
 
@@ -32,18 +30,6 @@
 			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 		};
 	};
-
-	led {
-		compatible = "gpio-leds";
-
-		led-blue {
-			gpios = <&gpiod 9 GPIO_ACTIVE_HIGH>;
-		};
-
-		led-red {
-			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
-		};
-	};
 };
 
 &uart4_pins_a {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
