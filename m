Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C6C5E327
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AB49C62D3A;
	Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBF66C628DC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:43 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGO0EZ2705649; Fri, 14 Nov 2025 17:24:42 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j3rpq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiXpvZ2w3sSyqrH4FcK2ei5fmGi1LOXeGgwuCnavcYU7C0Wk3GhSTNiHBnXIhJVpOUnWeUhdKvgpRicbOo2ndost+naIj0nKo3TvJedelqGPoHpblGkIGR5j11uMDkW2Ax0jGGdHNLAu0zPkKTcP1UYEMXNgbwT/IlNeLQYOJjmAqBKWMzixdibzPwsJ0iIH/d30394/cdN1Z8zp4hndh+YtbLeUozF4ma3Ra/0yGZ+QImh9I1iUr7/BrYfctRLMvfFlB9hcqh4/Yki2iiRnCpyBvXUxjdvgO4Qy0opuX8tWQqa5324l9rxg1mlF0dB6KcCTIcq6ABqvNavyP8OYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Doqh0mgbsH9h39pVc3DM+NqWgmSqyJBNdUDE21o7bqg=;
 b=iJVTkhfI9xZSkQ4qG+J0MOPfXGIveW7MPZGLHy5+/2Q0pZGUaDvXe1CuV8fXbMd0VMP8bfp+RKtsgAjPSKUxJ7UrzzILs9GNXq1YpOYeob2ytcCdxnzxssnBHBZMnsi9yAxNZVxr9Is0Dj32tbF4Vx/EWiVfMN/GgDaAaryZMIf3OemtD5HCGbEvbJ/1VLZ2mbN/Wrza23fuSkWn76IxBxAY9j7zSlgkyg/VBz2fE0qRlgT8EzHfLHcfimOMB4MW9gLb65B2BjLl/putXbbe0xQhqhxEH8u+7zrsX2sPUpwOh/S5dAy175tvmRvB5IimZ7TqHaaHQCwvoONrUlqwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Doqh0mgbsH9h39pVc3DM+NqWgmSqyJBNdUDE21o7bqg=;
 b=XLDxrmKoIIWAHZRKd8DCMskhOPJ2u4sAXWHUrHKdjSMEgdHZFrTBXYiq6U6xWZM7Q2D5hE/lkobajpoWpqyy0dBwNsYC2PKJXWsyO5Q6JI2dfwq8ureCrfHqXvs8ymHKKpCS+zKFhFp5eXSRlTG8I0konoVxUhweGAdQi8PA8i+6Iwu6d7pvhu4xn2VeuF2mjE7Fc9G8EVutpy948XuoWFA7WAl+qTpwERN30Wqupqcx+Lqf3auUDdi6qrmOPGV6SSFQgLcRK+qQOdoBZEvbXzBFcz/Yg63edPpbuyYT3eOwtYcm5gkP03kdGsWJIweTKjDlx4TAwLVFyCI+RU05PA==
Received: from AS4PR09CA0007.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::8)
 by PAVPR10MB7466.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:39 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::dd) by AS4PR09CA0007.outlook.office365.com
 (2603:10a6:20b:5e0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:39 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:51 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:39 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:55 +0100
Message-ID: <20251114162417.4054006-22-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|PAVPR10MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 76031f93-d9eb-4eaf-2ca1-08de239a4f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6V1+8nFda/MvwC+WkHSwgTKFJ0KM1Pm5BPO1h8sQC8KwVqLuL2XPNNjLVLq2?=
 =?us-ascii?Q?NcOrEKlrStByKpNJ0FLHCFCiTBYRvur08no5yTZxhwmoWD4md7XIMwfiZnx7?=
 =?us-ascii?Q?PSpdwASJ7JIrPY2p4zcG6B0Y0aXVU0fql12TOoZf/2qsjnXHhohlwcgTyJNa?=
 =?us-ascii?Q?+Fs1PAitoEMvcFE31VP8d4igkIuXQNYXd+ekN3iatQRc7L9TXkJZfzFerFBm?=
 =?us-ascii?Q?2N1afnGQOD+35zoBx7Irhi8eKqbypEnu5W21QmhRmr0MQ3MUqapZyrS08KcP?=
 =?us-ascii?Q?wWBhclkdknMAd/E/rHlUvhWmBsvUkdv9URbInTzJlUFr3IG9LyKBP3ElpdSk?=
 =?us-ascii?Q?yfvwOLWfniAr2a3LD0w5P0wBapUduLpXHyn0aAqLzp3/ce6T0WDpZvl4M6G0?=
 =?us-ascii?Q?dNAJGZ8VcYI0JDonVyE3pUXP9VCq2AvS2pHEeQgNujxRbj9HO0ot6ZhIzyBs?=
 =?us-ascii?Q?kMJOrbc1d9FDzVBr54Cye8xFxI4hW9HsP3UeME4P6lvK1obh1nYOek6NTRew?=
 =?us-ascii?Q?/PZpRRM/3QVIRZx/pH/VcSs2jjzkfxd8/satd3wrMWDkrP16HSNMoeW1zmCn?=
 =?us-ascii?Q?Zpzsq8MH9lTJGK37Qpv1+NlRe00QKhn38Aq0kYs+K486RQqei+w5UpCkLO3d?=
 =?us-ascii?Q?9j2FicXDeOElAdv9vc2DYKNYUutLCWKkx5qbabJypj1DSAYj948q7myHBcz4?=
 =?us-ascii?Q?8EhL6oqDP9hHXmvEe9TIx31t9VpVUouxz97//Dsp+7QV98HH7RZEEoDbBh9v?=
 =?us-ascii?Q?bk0gwMo0O54Wspt8F9/C0FKYzI8ctA6gPA6qSGnYMUd/50CG3EgrfRr/uRWH?=
 =?us-ascii?Q?gb+dqaxEB2bEQPHvY+dBYtT99vCQx7s+W/PUq0padxLOFJGJHgkHwhW/xPbx?=
 =?us-ascii?Q?/ZtMzHQ3xAtEhWJEvN6c3nQtkLu/79zjArhHb8m36s1mcif1F06wcwBtn5Kh?=
 =?us-ascii?Q?n9opEP1ltZJJC1A+GB1WGMlXV3dWbW0J6uKaVGCrWW1clyjq4mnubs0IFt5J?=
 =?us-ascii?Q?mdZBmXHsDh39sa+3W/pcZjBb3QyU8tse0b5ns/Muhy27luQ7PN19qVv0ut4J?=
 =?us-ascii?Q?GCwjakmkOBYZiwaMhNw1QPhnASG2YmcGrCCyud03ateaWvb+loITRwmhNOdY?=
 =?us-ascii?Q?5QiF74LnbVESubf646LU/1TjctKG09rvJey/eISLak6NwwLxwsEM9xPXTVqB?=
 =?us-ascii?Q?2KiG+1zvDFlkuC4ulRQF2W6SOIy7xYGLr4QM/t01srqjPh1FeUWMO/rKFNRe?=
 =?us-ascii?Q?0VFlFAkP4xMDZznbpVXAz20dwZQZjdrL1/7Nwx3Ol+Z8JN8UHcqHCkIKPI9n?=
 =?us-ascii?Q?KZTisdKy7kC3IaRVKfpFKcEjRcomC7kJZVel0YIdirAiT9XrMmGp6ImCqPGe?=
 =?us-ascii?Q?xoQDlS3lpF07t8Y6w1oS3AFsdMAdRVu1K8i6lON2KBOODN0R0U98RSZcVLdh?=
 =?us-ascii?Q?oG3O0pSUhOTz6FnMJDWWH5fubZLBO2Q0WEUHoDWbBb15Rssa80IOxQS8zXSj?=
 =?us-ascii?Q?ZTTtMzl950cIzngAk6cHDlkFgoh0JoVN8lUZigok3odlRADsyDLl+ERoMltD?=
 =?us-ascii?Q?v90E7koOGwXh8Ozg6v8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:39.7742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76031f93-d9eb-4eaf-2ca1-08de239a4f7b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7466
X-Proofpoint-ORIG-GUID: NNuV1Ov8Ns6ox5eIIgm6nfbLBi6RQH6w
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=691757ca cx=c_pps
 a=zMbTb8fadj6YZ5PPitvM/A==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=CmysW3ZjGFxj-qsZjvEA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX0ZJLbzFpdlve
 Fs+lwlBGwQVb2WwOZ6C3BWSWpHICBwJB73yEq5kWFwwpi2DUKVvc9W4C4y++QwLvnc2Wj1u7x7f
 V8tYFpJzHzNeaCuEO3+yC/OTbOVOS4ndeohLmSPAF7w/TQrpdCSH4agjZCHIY9CAlp4Vog7Yydv
 RAH6cgwqoobw1NrWbJiMPl40agPtNUwf26eYRJKKUalf5e8peRc1hQUyBp3zqo+qxynPMJG4NwZ
 FfsfqYqJV4NrVCMf4FilIL9pLmgTgwCq7lS2Q+55bgsaYRxFdD9jeNzVasMxWxg7+J0WSnxeTeG
 hNTCfB0d1YTKyR0i+R8DMwyV4ZGsBJQ8ky02wyJbVL8NQ41bQ4xFuJE7/Hgx9lEPTXSmbr/C04M
 jLU/LZUYDc+yBiHg5Z27D3xYXCUogw==
X-Proofpoint-GUID: NNuV1Ov8Ns6ox5eIIgm6nfbLBi6RQH6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 21/23] ARM: dts: stm32: Drop "u-boot-led" and
	"error-led" from stm32mp157c-ed1-u-boot
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
from stm32mp157cf-ed1-u-boot.dtsi.

Remove led-red and led-blue nodes which are available in kernel DT.
See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
index 77a65003f53..9ee0204f9fb 100644
--- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
@@ -14,8 +14,6 @@
 	};
 
 	config {
-		u-boot,boot-led = "led-blue";
-		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "fip";
 	};
 
@@ -57,18 +55,6 @@
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
 
 &clk_hse {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
