Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F2BC96F7
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 16:09:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31E2CC555B6;
	Thu,  9 Oct 2025 14:09:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8A62C555B5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 14:09:04 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599DmLB0019744;
 Thu, 9 Oct 2025 16:09:01 +0200
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv69mf86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 16:09:01 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUq5mSiKAb4XJqCFMK4m5QGSIXrA94yYYpeT6wrjF3yk2ZXEt77qneAsQ+FkpHAYCISpTABfrA3WnVkayXvwUONlcDXWewmam2+Gljwu+0qVdfE4u3Uj+JEzUp111pi9OPe7ojuUELJwR5sBAKUpPVq2PcbEOZh3gDNyMXsFfnfjlH8QkfpDkQ4t1F8FMH+RN5FYdockV/sPb7OJNpCW+ePNhmdgKwDhLYFt0Vj/1pJOLumUwgEkfVVPBpdvSEHC2jkYENr/jNldKjfYI7kJGvoO4s4q/F5TeTN5ywIWzRGA9QAUznIbgwk24jGyfZST7knO2CrSnE4IFFgKf40YGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wrChSXaJpjbtyLd7AKZPUHQHODbNmoxQCzX6MHjDKY=;
 b=jVmkOjOgBh/sAwZwdfFcAgi+WSX0+j5RAfII058Wi8abTGT69tFTWKAn9nbm8N1bydCP0E32RpPOGyVEHu0OP8mNLqgwAFTPVJsdbwtHsqniMmP3I5iR4HMohRBE6pgXa102y3PgVYjQEuuQmu0n6Hutuvm03wqs3qco7JyaEos8GeFOC8pZ2BfdJjCAYMNy3fr2IMF0cVoWbLWtd4INW4GSeiI90h++zr3feiq4qLRx/Jx6rGG0k4Ad5z2mBQwdACth6xzEZpX4m6nurF1XxYqvqxWY5jAN5UHsNQhNU4fwodZq5xkWWtNWVwjo/uPBdMBqRLpxleDCBUiDkmD/0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wrChSXaJpjbtyLd7AKZPUHQHODbNmoxQCzX6MHjDKY=;
 b=W2pzw1tznc9Dk/37Ujv8fGqo6ETxQUKhVPy2CODU3e4f//cOxutAdlTV914hpZUTsLcOWhFVJ8PPOuIDFj4cQKqYu8yYfhw0XU+KQoesNbHF7lV54LNYorXn024/h/2PYsaIdCwInSPrgLrD9wuhfzI9JWoCJdrMlQmNaSrNTr8xGBa0g2SjFLiFDSdl2EC4ZeB/XHWNmKIRx5JGlSZBBbNJz7ZKGjdAtcJUKG5RmJJrEV017SXy0n8WI2pFC9xC3/H9PS0Tiuq+VIVw4TnqtiphVhdtl46Ijuo+vdGagtqujqyzRhR7pqbNKj1rrYU6W9e9GYsYfdAtiEkPXWcWzg==
Received: from DU6P191CA0070.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::18)
 by VI1PR10MB3680.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 14:08:57 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::7f) by DU6P191CA0070.outlook.office365.com
 (2603:10a6:10:53e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 14:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 9 Oct 2025 14:08:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:52:03 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:54:23 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:53:58 +0200
Message-ID: <20251009135417.282290-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009135417.282290-1-patrice.chotard@foss.st.com>
References: <20251009135417.282290-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|VI1PR10MB3680:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a8865d-9340-4523-1ca8-08de073d62b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T1fiwv/zoc7fcR4VIDxNl1yCWiwuvDhjdmJ2mw4GLe4KD2PqOcDdOi2IAfAL?=
 =?us-ascii?Q?PJxPTlTWs2hM73MW4rUhy89pdOFhMPCTsmXA0tsUYcae+YboVhXSBh9MC58C?=
 =?us-ascii?Q?TJInJUVE6bKfw+T7BiC5G9bQqSOCqGGOl1L3DGOAzuF1aaQNjzjN4Tuiu/2Q?=
 =?us-ascii?Q?TeYAh2Fj46YcNPKho+MfcPdQVkUXeoBJDcxRpfHleO13b2ElQSoAfPqWmn9p?=
 =?us-ascii?Q?UlZ/wtmwljuAmMctDQwUWpp1NcfwVbzedmOfDCi+xGMt+4Pl/Hqt6UtBwytH?=
 =?us-ascii?Q?EYh9J91jFn5LlzW95fmsfuZMMrl4cQ8GtoTMXNHgXvNrgTYP5gULTSX6EMRX?=
 =?us-ascii?Q?7QwGZihyB5s9u3thxqGV3oFhMnPqHc5PWQ0J6vdAC8cYm3HFHFDHClA2UI3J?=
 =?us-ascii?Q?L3RsJUtT8PNNuTsNt1iUt+rJKYD5KkPy/prcggNOdKDfSrlr5sB2qmPGM/Z8?=
 =?us-ascii?Q?mifTSW14phk7TYJ99/5X88aDZb3YUwL/aRlrTtKjKKqk7A8N5FDG12QuP6Vx?=
 =?us-ascii?Q?cXfZdcvwqsGIgYseLaRnLpGlxHdRxE96Hjle63iHgH0NMRCEVrc9cE2tLxKx?=
 =?us-ascii?Q?Pab5QHdnzrYfdFKvKoFaLIibAdbg8OvgYHAeAzwA4kipkG55iBFPCU4FMh3p?=
 =?us-ascii?Q?Gbj1pIez9ei/b/JAiRu9sac3ybT5jg1sP515BL8Zt+p0oBrWG2dd0lboXOhP?=
 =?us-ascii?Q?+dpikiTv0QwYVjasIriRFF9crS2x4/e6T4z1iU4LC9u39T9f8OKb4p30dbPi?=
 =?us-ascii?Q?vieLB2U5J3rs6QF0aSmmouk/eKOd0MvOB9UCuJptDPGw0zt3TPxBstGiKkK4?=
 =?us-ascii?Q?2q2A0rE97MWxN/S0yP9laj4is+C/zLar2W7ZJzmpMEAmABFTb/X8exCJN0zR?=
 =?us-ascii?Q?QVQnnRao0uPH3ObqAb5pEaf7VQBNX3H4ZlGXAWDsAzbeoe1OdtdyQkv+PEpq?=
 =?us-ascii?Q?13wteomc/Nx1ZJmkWFYm0fX+3tsTtREATi/hq6OLE08QXjS6pEd5psm7+pRJ?=
 =?us-ascii?Q?2uhJaIylLqxjFvf+LrMFUohoMVZvhwyVNc9MHJHyAriWOJp53LNGlEBuYLXG?=
 =?us-ascii?Q?U8ywGpCxKyh2azxmFWDkHhpfuXZY0Sh8xYZBNeiBMW2Yw1MM/AboFN5pX35t?=
 =?us-ascii?Q?XPamuU6tM+WUMspF+T0WHPv+SknAWGG8yJxQt65cCQRWy/qj+5lMMgUxmBDd?=
 =?us-ascii?Q?9Enot4TqbQjSQ9nylh5cYCJJJZ+fdp4xm+EKcCxBGwfEu4eiSs44nQGyMHzx?=
 =?us-ascii?Q?92j3T/glrRR375fAcXfpd9Et1+q2s3cA68fYADYRi/lLtaM/33V5+xa9eI/F?=
 =?us-ascii?Q?3AmSFCd6VFKBX+iMi4Eh6lc2PniPVASDM0zjjSrJ68tDCUHQFeeLRLgJiF5u?=
 =?us-ascii?Q?8ujNARnCx5FTj/pc3Mtr+puiHB8/2CiTEFKwoHkgc9tE9rotSwLf3LNMMTT/?=
 =?us-ascii?Q?Hf5RchlI5REoW2VIl7dczimEFpLPHnhSZOZlFW5WHSgy+Yax0E+a49FH668s?=
 =?us-ascii?Q?zOovf5wHXqgqP9orCqs55gb2uATkOJwdD99LfUJAUzCC+xnfdytfFIYusb3J?=
 =?us-ascii?Q?P99qwvOmZxFTsQWpRTg=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:08:56.2707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a8865d-9340-4523-1ca8-08de073d62b9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3680
X-Authority-Analysis: v=2.4 cv=F4xat6hN c=1 sm=1 tr=0 ts=68e7c1fd cx=c_pps
 a=Hnq3Tjo4AW3aKPKNM5RF8w==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=NEAV23lmAAAA:8 a=8b9GpE9nAAAA:8
 a=kCQY0q-K_Oq8h35laxoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: ZF7YDOJWYdpL3pkLH0OOLlkTdHlp1ARK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4jz30KDhooIy
 dFR6nO1K04MwlE26ZBLscO4YX6KdQITYjaeD4Za0WNSCdpapOS7gX0UBUmxKHl5fPRDmspTYcaS
 8fpgeJaTAMEWtG4+z70IzuK6T3cLzNOmDr4Z7dOxmcdghERuqZjdFvMuoo0XkTLCgBR0IolEyiP
 fK+TDv+n3QCXdGLGSivmRNRF9zUnVkOF2K3yL4olTVm2AUl8OPxV82jAblTiPnQD8ZlMOUH6RSx
 dKZZd3y3ED9vggwC/XhTm+8vcXGPPhmzQDj9MezhZ9KNtncvTtZDobU7QqkdiGaY2eSf5msYyyr
 rX/s64qPyj6GXE55gMJPURdjHDmdk76/bdAYV4jbEqlYDKELM7zeQhkDdxEn9ZTQMJs90TKO2eJ
 Lj0JTJlD97ETUhpn6ZidveKYmpCGqw==
X-Proofpoint-GUID: ZF7YDOJWYdpL3pkLH0OOLlkTdHlp1ARK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 04/11] ARM: dts: Update config node for
	stm32mp157a-dk1-u-boot
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

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index f97debaa0e4..ae3933fa3de 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -15,8 +15,6 @@
 	};
 
 	config {
-		u-boot,boot-led = "led-blue";
-		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "fip";
 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
 	};
@@ -64,7 +62,7 @@
 	};
 
 	led {
-		led-blue {
+		led_blue: led-blue {
 			/delete-property/label;
 		};
 
@@ -72,6 +70,12 @@
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	options {
+		u-boot {
+			boot-led = <&led_blue>;
+		};
+	};
 };
 
 &adc {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
