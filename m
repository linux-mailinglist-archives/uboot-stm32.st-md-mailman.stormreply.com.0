Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFFBE88FF
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Oct 2025 14:19:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6863BC5978F;
	Fri, 17 Oct 2025 12:19:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13017C36B10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 12:19:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCAh8p019150;
 Fri, 17 Oct 2025 14:19:09 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfavnxhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:19:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFYyp3ywak6ftBxkU5ZMSQSWZw0NhYOG1HfZzUqvSyUJWJeKkye+4xeAK5rJBfkSu9s3TkFvdAm3B9mJJBgtGopJT3sP7PIbUD8VKSyHdUB+G0MwNPo4tifoV7vmVTHuyCdwEk4ZD7ZH45saqW3XeFZj5U9CX/SqGPvGmS5aAgXdyt3olDPvL74MNqkmPcRKeopgODitNqLWLRHjgo83AhMVd2bYlSePc53X9F4ZDo+flDjy9BRs4fkx3T35meJhtUHzrQryP5ZWwDypPiI+mIBtj9xj00Fmv3m4Jicka55kXZNf4uuNFxWd5Ww9JPx8otxvzW4N8zwb6Bg5VZTRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pb2HPnb1fqCeSxAZpHow/vfHBNFzFZy99YCClAQGd1U=;
 b=oDRybQUEKMqUKwqjTWL5xTgAwmm+qCRl5HmSXLZHtkdcVpDCd77+5YLXvdxH4k8JhZgDDKgXX4PGDlRjgRFBrRC9cDHA2wZEwnCLyy2lmdw8M6cUzSAqwfM3TZ2IgnF7qB1awXgXQd47f+7+64RXWsOE0cOd0FR6ThXtMwjAmyYhQBWOv5kxDC6qK12/y08yGhRaI7n3eJXs6V3RS9FKGjzx0ZuGDHBZsnVLb25NmerDRfdNVqSY0iKgWeb7jKvjps6tnKQeNeFgVhthO0OrIbS5wg2D4SBq0RvfSUbDkt0evmOnae0knWIKngHKakNN1/4FogL32DSFvMsE+s7wgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.41) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pb2HPnb1fqCeSxAZpHow/vfHBNFzFZy99YCClAQGd1U=;
 b=V9C/KUR44OSNLNj088ORinFCL/Ui508H5G+6Ydu8GYarUi+NKEdwtJwfaqiXGP7szEGCLYGVqT9S7h22yS3So28ItmEBbBAp6aegvMo2QrN2dlZ/bBS0AB6C5Ay4NuK/hBnI6aI5otAHCTWYiY5C/JXJL5axxiEE2ekymoCyiShGynVeiqbatgVSG6ATysdIS4+RcKmFMAl9tS6/jNlnv5vKJc65e1OL6ndDE+TQy3uw5h6rH4MhvmjonInZ+pZp0fD+e6i/22OmQw1D98vcypLse14pfn+loS4+7Exkr0jWZRE4qb//a37Ce7nnxFhJ58t2uSIR71T1bd1zl8jAfg==
Received: from DB9PR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::33) by DU0PR10MB6387.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:40c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Fri, 17 Oct
 2025 12:19:05 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::87) by DB9PR01CA0028.outlook.office365.com
 (2603:10a6:10:1d8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 12:19:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.41)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.41; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.41) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Fri, 17 Oct 2025 12:19:04 +0000
Received: from EQNDAG1NODE4.st.com (10.75.129.133) by smtpO365.st.com
 (10.250.44.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:22:18 +0200
Received: from localhost (10.252.15.38) by EQNDAG1NODE4.st.com (10.75.129.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 17 Oct
 2025 14:19:03 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Oct 2025 14:18:41 +0200
Message-ID: <20251017121852.109561-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017121852.109561-1-patrice.chotard@foss.st.com>
References: <20251017121852.109561-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.38]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C5:EE_|DU0PR10MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: d186b022-d27d-4d3a-6730-08de0d775cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KzV/8TKb8fCu4nJBXqLN2I60xKbyXo7qpVdjI1QlGlLslLAzxnWJol58tVm/?=
 =?us-ascii?Q?ZwAMCupKO1f124zTNosj54uVN//b0ysZH/vVHU+XR9oTpRGFRBCo4TiTqSPf?=
 =?us-ascii?Q?gqA0G1uuM8kmS3BPNR4bCMjbxWkRpeiNg4xoE2vztt2baCPt44YQE63q71Ji?=
 =?us-ascii?Q?gNS0XQjRDJAnhHoCwbGNFlvjPYbwcVglPA06lKUsznIAHpDyzDl7u6qknDmI?=
 =?us-ascii?Q?puhuJfgbe8KXjjJKZ1I6TUyenL9mnoHMT+sJh9VC6crU138Mhz8Pdo2Qtidi?=
 =?us-ascii?Q?B1bHz5lGUTJxGKmLigqeuIjgSFsnJh6CMNW1OKmZax2lQNOeZmzMkf6Piulo?=
 =?us-ascii?Q?nxukOsHX1fObfd6QtrOxYUDL/MyFjd6Ir/bEInc8hAxJkYxLeqrdenyc3uTT?=
 =?us-ascii?Q?nLfmmwzgQeE5mbUmDdO77ma5oQZ97njqQA4WWcqTqNFIyfca+LsxbV352rSZ?=
 =?us-ascii?Q?Zzor+5eviGKpgt8GH9zj33QmlgvTf6wh4hl4MFYuWGxembwF7OUlE/0wsyBX?=
 =?us-ascii?Q?NiBQzoDbg1XNVGmIPCusrDlbjjI4ftbdNphcfFQXudd+gEeYrqvTx2RStQM1?=
 =?us-ascii?Q?hY6TGVy9TKn7rWpiWFIYpNngBK751zOGSWL7MHYWwS1ybXKLtwlU6MI+GDK1?=
 =?us-ascii?Q?R6+thOLPgjtVy3JK0eSQmTwK2ufGBJMDcCnUjJ+X5vwOk2P1gTpOycjDyf53?=
 =?us-ascii?Q?6BD9nn0Fq0eZnrUblyylTKYz5ABDXRqkuve/BOSVNsWs5m7cBKJomiWpeEN/?=
 =?us-ascii?Q?I33kZI2/APNoCmNw62SfnX2LkNNkzckFTnKREYDSL5aVokOgsIHGiuaQqDY9?=
 =?us-ascii?Q?XetnsxRbBArTuNammcra6IRPhA65hKrSOBdKEPknTWclZBW4+Ux2EvWh72ZM?=
 =?us-ascii?Q?/BWChfdMrKGn0o06Btp+8KKMnkXWVWXMjbnXD8Xw3uUnX0ZSpIDTd6a8zddR?=
 =?us-ascii?Q?oPE4VInhqdJqC3Ge1hAcCYtRw1wLeUnoqL40oDxzJBfcZJEwdoKbm3zrRbIJ?=
 =?us-ascii?Q?gj6xSx1lhNqiPEjTy7mVlccEYcPJ4mj12NgCIGpw+PMdzgsmTP9V7moMdk8Z?=
 =?us-ascii?Q?B3+ExZmUTgOBKGB2CKG2wMYUSNffb/AqfTACmwGfbBRf2Mlt6katGdCG/mZs?=
 =?us-ascii?Q?Qs1V0sjMcPVIMs606IY0xsX/3Kj5yKu9GqudyQ2CVTGEowRAavZfacXQx07X?=
 =?us-ascii?Q?k169wCM7sJiOlNLunL8Eevz5BrnL9is8ONEF1ul+GBRSMzIp45zih+4CLN+0?=
 =?us-ascii?Q?gXRwXPpftiSKi0bSOkwiPX7ORKhHZS4dyy76jOQXd2eW6L6QSBZSuVGW8YNl?=
 =?us-ascii?Q?cNjtHgiOG30FQG0HYkwkSdLAuS1gZoi8AbHD5ExyszwOawYgNU0nLdwTkB5y?=
 =?us-ascii?Q?y1vW9I87mEqt4d1Su7Xjl3zwTuSGEV/ww/UnaGspUf/vrTSIvbF66asQk53g?=
 =?us-ascii?Q?tEJbVK7FmR00vfnH3O6Uh93pHLEc7eb8DKGQdMPCbLkir//J1IOk1OJTO9Jt?=
 =?us-ascii?Q?NRgCCcwaCyFZGPQS5z2ztYOu1WZOosnbmSFGB0Nl53lK7SnyrF7RdX4kC6ae?=
 =?us-ascii?Q?zzU7wspwq/AbrU9Zau4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.41; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:19:04.3330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d186b022-d27d-4d3a-6730-08de0d775cf1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.41];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6387
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX3qE12IRE3jz5
 Jb9Is6DVmbb5xoqZdURVJE1ZNEMWpjyhxx7xUQ/46PE1dTbQ9w8CG8BGT1vHXu7f/KAB0OKV+hG
 3IQe3CxTpI/LXyEL0KeIWEd2FAzdodPZ7hW2+AfRKtYAIQw8eAfufpcCs1uuXH+E6QAszTyNcHY
 DLAkiKuOIo+Cy5urDYhtOCO39O/Fi2+xFj/DEB9Ag+LHwEYSUfnZVFC23WhWal2HAA83uOGgAq9
 ilbO1+YspBSosrjjJbJtc4iYS7Z920dMCgJOfbR69fNPlDTVBJ3azz5bTWnLL7I2WK/MdgRpO9q
 x3XEwbjyDoWkzVCaWpbKMDRV68+KvGgxTqyyvoy85p2wfVUJhAG/xqaizx+0fhjJP9+1TthT8+A
 Np6fF+1tZt+l5rvmNUB0cWfCrLX9vQ==
X-Authority-Analysis: v=2.4 cv=Ne7rFmD4 c=1 sm=1 tr=0 ts=68f2343c cx=c_pps
 a=sV6OQNfo2Rq0ezZdSbcsFA==:117 a=k+92ZC+kR50ztVuylSZIGA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=gt-GhcMM7esA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=g5--MkaRgCOj-ZVQwt4A:9 a=zZCYzV9kfG8A:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 2QtDjaJ_I6OYPLild-kYv-xfLoEcHPfF
X-Proofpoint-GUID: 2QtDjaJ_I6OYPLild-kYv-xfLoEcHPfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 4/5] ARM: dts: Add txbyteclk clock in
	stm32mp235f-dk-u-boot.dtsi
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

Add txbyteclk to avoid error during clock registration.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp235f-dk-u-boot.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
index 1bc77874050..84279c4712a 100644
--- a/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp235f-dk-u-boot.dtsi
@@ -10,6 +10,14 @@
 		u-boot,boot-led = "led-blue";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
+
+	clocks {
+		txbyteclk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+	};
 };
 
 &usart2 {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
