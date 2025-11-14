Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 903ABC5E325
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Nov 2025 17:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B184C62D37;
	Fri, 14 Nov 2025 16:24:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAFEFC628D9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 16:24:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEGCs6n2661201; Fri, 14 Nov 2025 17:24:41 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7pbvr8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 17:24:41 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaXPGY7LYbYJ6P6bKCpo/NH/6FKsWg2r8xZOv8s5S2JXH7aCJpTzyiZhISbfOAeZJesAUZA6XbFgfQuMXo5FgeOevctnu3UyBdYLq07uFLSR6DVDqVUaM6Zz6Mux+8zrOyDQvM4OL9LctGDeaMTPWDMwXHEuh5ciAMmCjsM1FNk9rpSDS6aDyIgrwNHM043BwXEfdRQZ5LP4nCWNvmByvRknaQDCiDnNR1D9RR7aNzcAZbu1EYplPo6Kp4PIy0XgjSjS07YpA7bDpXZPVAvhRWaH8SID/6rbWrFJizAkEr0QDwULbLxA+HcY4Nhf27Ez+pbQIbb9mc0EfQPolnNgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kkV1LxfYuWtw3DzunDJoZItgKpaSt2xxI9kfM9xbiM=;
 b=asCNcS88xOA4kfPr5mlX5+xuiidzrlXUkk5i8A6itDaa+PTCgzQrjQ5MF9b3aiphIbCN+piajWmSeWygmQzt/SD4QaRccXsFpmARUjj7IEs4nX6+TdxLP3evr0lEkGSlG6vh4jprhRi4c6k2fuas3mAkLOur0qJT6asImy+GM14AhsRl363JKZFwSTAaCrxIneG5zrAseXsjgAHtJzEkriHq+cw6tIQroQNFNfWnwp5s0CAYClJTLq0YyljL2myBfK4iWt2N0ZxmG02andK/Aw3Z3goa6JQNzs6BJd0oKpjd5rmgvaoeVTNcvCyfIaQ1rrS5LmMBYZPtCRLiDIKPZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kkV1LxfYuWtw3DzunDJoZItgKpaSt2xxI9kfM9xbiM=;
 b=IqW7szy+jd3kLLuDp3WNYsuTZt5gaqD5Cs3w79+pcY++NWUkAa6LHEGQU+zccRgQvLnXTrHUnUzAwCzUbH0vbj5h9K/tbjCd3pI/Fa3ILL+Fu20AsifBdz43agxC62jEP7f9MQm/zw+F2CRSeQVLutF5ZXJBl0gvpKxOAoQ24vqG5GF85OIiQLMqi943xdPabntZb+3PpXoK7rht3V9WSrAL6pHbXKxHiJAspfOajNwicqhNp3OxM93nGAeoEiH00T8ry2Vd0AB5DYKhq6D6PJPWhYAi992OMqoYNL7XLs1tyJHDjo0S0KkSkejtIQSx1cWMpvzifLN0vLl6kUmZ1Q==
Received: from AM0PR02CA0115.eurprd02.prod.outlook.com (2603:10a6:20b:28c::12)
 by DU0PR10MB5849.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:24:38 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::8b) by AM0PR02CA0115.outlook.office365.com
 (2603:10a6:20b:28c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Fri,
 14 Nov 2025 16:24:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:24:37 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:50 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 17:24:37 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 14 Nov 2025 17:23:53 +0100
Message-ID: <20251114162417.4054006-20-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|DU0PR10MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b557785-6a6f-4758-a16f-08de239a4e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?emSYmhz1vSUKgru1cb/QdR+HeORJbH29FM/BcwTOj5BchxSoLKAbIh5INzhO?=
 =?us-ascii?Q?Cofy/kKRyzplS/NKAMzhNx1j4iTYAbD0sjTWVKo51YOXzgXQ6TAFA4G3upWK?=
 =?us-ascii?Q?qsmD2FSvMKF7gSK1YPlXz09Y0LJXW9rmAwz0W4MTSWIzxiLmAfhJNphTvuSF?=
 =?us-ascii?Q?+mOVCaxIZQEFyiV8cNWSfhdWUNcgE03JNK10ERn0+YPzFkOZBpvUXuAhDFYB?=
 =?us-ascii?Q?cSAYhxO2tqOkLtkp5Dd5VRJpkLJLx/MAhAiBhrzzBF2qLQzpXo4OeWWM8UyN?=
 =?us-ascii?Q?s27XjoXy/40ZXy0jw55kOHPkRnZD97Rf4oD4UEeUflAcovKRmCustVjCCq3q?=
 =?us-ascii?Q?k8lCz0MQ9WF+pjDrmCsLskxqhBduCq/dD2pcn3bBbwrokSbWAcB+A6IPHsD3?=
 =?us-ascii?Q?H+/XlDDXrV0/+5e1CEHcGryEYuw6niZYrHs0kWGNJRsHIL3A1lX1TKYF/IVB?=
 =?us-ascii?Q?N7UAlMvJZvNubi3QRbQPRAt40W7irGsWIAUyIW9ntO4Y/O6oU8xjTrRYUtps?=
 =?us-ascii?Q?/bG+WapRSnQ69DTClDqzTKIsjFDjth3EGlHo539v7QIp8iFid1YQNTy9Lo5D?=
 =?us-ascii?Q?guJce8eoFBw9sBR3dNK3qR2yeS2OH7xaHTmwHnLoMroWrauULahFFGuYtmH1?=
 =?us-ascii?Q?QGDchizMAwk7Z6lywvYv6o1zuTYL4rXFtAL0wkXyORo6xzIs+AJMkMr4Yu2p?=
 =?us-ascii?Q?4CUOQHxmCyK2HgAqYuOvoDnmVR5DEoVxlyxxHT+OsgIu0WLynRZ/4TwFCQqK?=
 =?us-ascii?Q?w9armHbnwsg92jOZ5/FoySg74o9GQlmPs1w6Re4b8xsilCZl4vnLEwPKiQ/w?=
 =?us-ascii?Q?BEJrrsRXjvwCpzS0q2IprV4oPaa0Ppr/dy86ZzgASmoxfebCIJkAd6BxjxUe?=
 =?us-ascii?Q?f+/HDjQd7/39cl4RvzrJ2lc2bhjTfFIQ9cWUS5mbhEoBqdh+5gwG97k9/8Xv?=
 =?us-ascii?Q?lZn85E1bBhMjW1ySd/URLa1cQhMqlIKPz88AFi+dptpxv6b56/l7JzXZmcSI?=
 =?us-ascii?Q?bCJ1Y1ICJqv7vAgUuSeawVk4+hBKyAW1oRsV/W/aOlq3WZQsc6o/xiiZeU6K?=
 =?us-ascii?Q?L0hZ/i8y87v7S9vWQxR+K6tbIqvZ4wXu5rk0xYszrTEQAT4sZzLLw0vkvf5T?=
 =?us-ascii?Q?S1CVUkQuS+2FKQYQm0C36H3I+whMtCZgOoiCdqYuXdV0jFem6PGK50aRqGgv?=
 =?us-ascii?Q?2itbVzJl+8JXEOBa93E5gBYWO0Nh1ZLxbQWhP8hvnkCAdLsp/QAIUYLOAlmU?=
 =?us-ascii?Q?xDBSGVaR4kxrxcu3RC9yudgwPs/+pD4Nd5A3x653vqbtGhVE2kLfmJqmHRQ0?=
 =?us-ascii?Q?qO2h8QALae9gFS1JVkwBnm8J4vN3mDxtAt+Yq7uaS0zQtfizWl9K3zylDGN0?=
 =?us-ascii?Q?GdGDNVijA8iYDymVzxzd8JJlko6NjMKFwKfbNCJAH105pGFMsG1ld5AeVyXR?=
 =?us-ascii?Q?tE1cjK+TGK7Pc3iuzp7kmFNVls1l/j8Q+zyOHpPqyLuXxhsAK2gC/QqcOS5P?=
 =?us-ascii?Q?AVo0IQvWf2UHSj7su6CbJdOAkp2ZHLjzbH99jCKMsR79FNWm+otRcBvc+0bR?=
 =?us-ascii?Q?vegkj5+4s2RzN+QSExQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:24:37.9698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b557785-6a6f-4758-a16f-08de239a4e67
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5849
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEzMiBTYWx0ZWRfX6TvNLLf466fe
 55swUD+vedRDVY6tNZJKPg9Jqa0crlicDL3OM3rcXgdOU6fZupkSiHKNbFwx84gprLksasoswcn
 y+6DsZ9yWq2si8JPdujb9fGM0ruW4H1Ed//jqMVhne332tJSLq+v3V68+7pFW+b94/Eh6rE6IO5
 MxeI//ixo7QO55fUUo/K3kwgow7t8A1fmPQhirouQTNb6xr3RIIirFkAEv1Qd5dKzqtvs2JoYsY
 fHVBitADiNAOkEjLO0BOcuhpHPcoOj/mCggf/eg1k5b2RN1tx6K+slQa70ExFUlgZAVKMSIy1Aq
 wDEYQHbJX32TVsvZIUbvdJjy8LF7HQ4+cbFeO0r8opP+A2Ms+2idUjR9/A01yOOCYc3y+xvpiGd
 JK+3KU9tf++IU/f+vBC7QywNDQw0Fw==
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=691757c9 cx=c_pps
 a=reNh+0L7tg4QYrCSRqU68A==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=6UeiqGixMTsA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=5Qe6RSIVTcPmmCO6od4A:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: N2RSqbcEfAsGFhDaaIlyGFURBavoZoBt
X-Proofpoint-GUID: N2RSqbcEfAsGFhDaaIlyGFURBavoZoBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140132
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 19/23] ARM: dts: stm32: Drop "u-boot-led" and
	"error-led" from stm32mp157a-dk1-u-boot
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
from stm32mp135f-dk-u-boot.dtsi.

Remove led-red which is now available in kernel DT.
See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index 4c928499f50..41583396b1f 100644
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
@@ -68,9 +66,6 @@
 			/delete-property/label;
 		};
 
-		led-red {
-			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
-		};
 	};
 };
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
