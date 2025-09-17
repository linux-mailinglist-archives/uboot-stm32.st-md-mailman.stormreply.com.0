Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C477AB7D9CE
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Sep 2025 14:32:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DFFAC3F930;
	Wed, 17 Sep 2025 12:31:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80E5FC32E8D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 12:31:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HCTRLR011113;
 Wed, 17 Sep 2025 14:31:53 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxkuq7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Sep 2025 14:31:53 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvRNHZx9N57aCM77oHJTGnIWacYavFi7p3RA+E/LoBCUXD2d1vXCtHLrRajJlpsERNA4NTpl1jvF6z5FndMAV7+tlg7Dyq4Km1rgwXsBXtxOD/4MGhjN5Sb4U61kLh3yKWLqfmYm671yzmVAei/KHz4/hO+0OJZ2/yUrJ1Fybln+0O6uYKUts8D4kRj39PlMyGa3+CW0koO7Ct1pclfzYwBNEkOVMV86vN9Xhq9Q6TzG7kQYyQEPvEl8fFMgOcuhXAwh1B6wQA76QpJOa/DnHXfHfdBjuPG5KryQFkGDP1lncQQl7H6bjFPlji4Aqw4ApF3EC3JKfGH4vbYljwuK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZv2tf+yVyTEZl9xdMNPoRF5znqSh/c8x8DPjHVrTVI=;
 b=RvyAi1WUMaqcUlLow9tausjLf4nyzC+M7/GGzaDMqVpyvGbdc84HaTDll8qcm3ReYvEKyWxJQ8t0QOeABeZlzm8CRBVjfp2HRpgjKMqTJ2pxfbCkTYuENe26FLiyMnYcbTH6iR7Sow1euyiroOvItOkJCmbbF2clH4IhxZEHqHLghomoJOOg5mwpiVQZqNSpHqsqJVAeNDbhOvLNb890w2QCTTYpw1RvGndRCx8E0PF/NOIfdTvkM/ar4s+8TyspXk/zmhpqKTpT2BResre67lMGTyyiEKHIagm+q74Li+N1g8um/jRfymP7bOHRy/oKvqHRup52zg8lat9xKYxAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZv2tf+yVyTEZl9xdMNPoRF5znqSh/c8x8DPjHVrTVI=;
 b=L0TRuDfluaiJC5OBGNODXSRECgEGSNhAlygDIR6gUbQGzqyM8UX3n1q7b1LS5LRV/X6X7J/oGBazEC9BeZdRbx0T1AiSAAbsdThAv3tTIJQg48uLD9fbaB2pTYymkAbmmtCo2fNmXuT04zMjwtl1JdgxC2otcosO2GmaDPi0Pl97JqScFiv9g6BUuY2FA4ijkacYy4DLSy9Byxjc3akqb9PjNz/PpHjrR/Ii4wAQQpoCrmHuHpy/vh1VQR5pnchm2OKosO1RC3aiJCMbjGPc1nq//a87EuR7CgMLGkzJKaHb5yu1YfubDGpsEb27LsbTdqhwMZOS1HGP7HOyHIUL2Q==
Received: from DU2PR04CA0232.eurprd04.prod.outlook.com (2603:10a6:10:2b1::27)
 by AS8PR10MB7682.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:633::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 12:31:46 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::9) by DU2PR04CA0232.outlook.office365.com
 (2603:10a6:10:2b1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 12:31:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 12:31:45 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 14:24:41 +0200
Received: from localhost (10.48.87.108) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 14:31:44 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 17 Sep 2025 14:31:30 +0200
Message-ID: <20250917143100.1.I876db43eb2dfbbd7882ab03bc49ceaab61e912ee@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|AS8PR10MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 491f683e-7f72-4d71-a0dc-08ddf5e62a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gIHUqDIAgGorWZYgeDHOom/yGidOcEC9z62i9OCgRiSOdD3lttR66mqgNRcw?=
 =?us-ascii?Q?n+eoHSLF7E/HYah3h8CB4ayCeWvTFGH+C5jhHdZCT750W++ArtYealbEGGlA?=
 =?us-ascii?Q?tT1mhsKlD9CAm4mOD0IhzxkOo3QkpNGnzpQMFD73AAw++BVnYusowHqWgV9C?=
 =?us-ascii?Q?uzHN11JeNkj4t18I+9E47eDwojkkFWNWUl7AXiujAfWl5ijClz5bN/5I42bJ?=
 =?us-ascii?Q?NO7/Oss0CEDOFYiI8RHNxOPxHPMqLT/zDb+UGUG9KuSKgHXXNOLJ95aky/dH?=
 =?us-ascii?Q?horfO1fmW3BUWHfGtMZPz5u3JZTmCqG3Th0Lc0hBj4wCElrPRt79S039+TCo?=
 =?us-ascii?Q?mwF+ccSk+5whua8hOty/loLQBPCF+1usvXZlB9QMBFOOVsqRd1HLTJDn/YEj?=
 =?us-ascii?Q?uCL43HjE4XyFPQymflniLWNYhsfuKDBUuohH2ME2rPe9BFGmYa0EW+z/M28J?=
 =?us-ascii?Q?liuk0ZyXX0PdNBtP77UNAUR8NV+5IbyNyc1QPDfGxueERVTGFtnL7lvHolas?=
 =?us-ascii?Q?4Gtc0+NN70R8uS8p/HW5Z7LHNauGJiMx6TKn6YSpV7qHIhUVGTaG9Zs6Jsn4?=
 =?us-ascii?Q?i3+MudrAcrvfedyaxLbJJpps79ZdB6xvJdhlLya03KzSfCB6sl7t+PN+NX7F?=
 =?us-ascii?Q?XSjoYH5Xru5z3ucdzeWSsDHPnhZlTULju+9AsgZHOyh8dZDDQCRpktPudbUY?=
 =?us-ascii?Q?F0mQvL3aKaYuvH+roQNuCiyEX18Gj4sdkFKM5ZbhgD3n/bZhlhX53WhDLdE5?=
 =?us-ascii?Q?wxgOd1k9S2G3/7LZmBM9cjda5zI1P1ytPumBhhKRSPWZ18GrYH/LX9jJN9EX?=
 =?us-ascii?Q?wv7R9RjK6d6CHRS/usethmwcsDhIDiosWUolvXQJI0nmupvYQ2dLiczcaPo/?=
 =?us-ascii?Q?k76uaQNm+b26qr9CYge1eYXDos85rWhGufwuvQd3rZewX5I133QEfmKKjbq2?=
 =?us-ascii?Q?3pLdABV11zeyLCeQbc3HzDc0XfprmQCkYDXZ9G2D41wPR3qaHRSrbST4ANFM?=
 =?us-ascii?Q?zqkwcekEoPfaBeN1+rSBrSFqIKb9OjnGxp21HZFFoEReTbIYL2gfIT0wTSz+?=
 =?us-ascii?Q?Nip2dpEVSYT7WBrB4Y7zI0y1uX1b8eT7OD+A9JFyUWwibAfCR3rodWvj/c38?=
 =?us-ascii?Q?7VjHo+s5zNLhM8xtM23IQZlJ6yeMx/xtOZnciv6f0V+Wozj8Bda+Hn4A8cjh?=
 =?us-ascii?Q?UbbGBP3mJS54fTPZe2kYioMnjTE53cMz7dnheXBxqo6D+35ofMAX9lDHKhKq?=
 =?us-ascii?Q?Xv+AZ517VvtXJiRWTsHNChlFolGKfmgFA4YKlp4a1hbxGEZUDa3WOahBRED5?=
 =?us-ascii?Q?ny9UXh9b0DCB9YkL+LQ+boLj3IVZKeOYNKI6z1UbGKTsJ5QKtgRBohcVvIyt?=
 =?us-ascii?Q?HFDtqSsFtkh726DfQIgjlLD2ujvLU9AFN4shAI30QTqki9BP/WFiD9qcsiyE?=
 =?us-ascii?Q?HX5dkM6lG57jc9Hfpju1onIAUeNgyyOb9mDKdISnlHoHBzH5MCxpkf4+AlHn?=
 =?us-ascii?Q?GuKWc72Z6kvK0BCLLUnTwDzm6zHD9oTYp++N?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 12:31:45.5346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 491f683e-7f72-4d71-a0dc-08ddf5e62a3f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7682
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXy9A73TNEhRlc
 NyaWGyVymljjs1etjxHTllZc3MrXIGFn1/lhC/bRuwVpbOmSSpQHdwmkPir9eqqV0gwE+11hLz8
 Ee6hGATJorbNdXbsbOtZhWF1mNY3L+gyiKrFVGDO73Dw/6H3ni2oQv+8DnZWfM5f2mZolyyqciw
 7znLMkpjBhU+YjiPGuEVhjY39np82H7h5qHH06RFm7x0lo4Hx8KE9CpCFn9EF1/aUTTUey1PfLd
 xXv/B/YUkehj8iCk4RWrXGjPR0oAHNO3vI/w74W8lEZOQL5GMS/rcR3nfO9NXafQe7RA0eLIY/4
 FtKin1WaysxchO081V7TuQ6e7ofOuYxMDTHdz8s5jLWm2OIt9rQKH2W+VilLAI/UHSzlHWz4euC
 pyoh14r8
X-Authority-Analysis: v=2.4 cv=JYq8rVKV c=1 sm=1 tr=0 ts=68caaa39 cx=c_pps
 a=+y45bHUe2Iy5AfYlPnzM+A==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=q6CKDgr7omsA:10 a=yJojWOMRYYMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=8j4BDcd2S7SDEnxQ_SkA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: USVqALG_CDecm5IKyZNjNpv0oTq9fwYA
X-Proofpoint-GUID: USVqALG_CDecm5IKyZNjNpv0oTq9fwYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Cc: CITOOLS <MDG-smet-aci-reviews@list.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp2: update register used by BL31 for
	boot parameter
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

Use the ARM64 kernel booting register settings, defined in Linux
documentation Documentation/arch/arm64/booting.rst:

 x0 = physical address of device tree blob (dtb) in system RAM.

so kernel can replace U-Boot in FIP without modification of BL31.

Use x0 for future TF-A version and keep x2 as fallback to be compatible
with previous version of TF-A BL31.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/stm32mp2/cpu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
index c3b87d7f9810..e081dc605b84 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
@@ -92,13 +92,21 @@ uintptr_t get_stm32mp_bl2_dtb(void)
 }
 
 /*
- * Save the FDT address provided by TF-A in r2 at boot time
+ * Save the FDT address provided by TF-A at boot time
  * This function is called from start.S
  */
-void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
-		      unsigned long r3)
+void save_boot_params(unsigned long x0, unsigned long x1, unsigned long x2,
+		      unsigned long x3)
 {
-	nt_fw_dtb = r2;
+	/* use the ARM64 kernel booting register settings:
+	 * x0 = physical address of device tree blob (dtb) in system RAM.
+	 * so kernel can replace U-Boot in FIP wihtout BL31 modification
+	 * else falback to x2 used in previous TF-A version
+	 */
+	if (x0)
+		nt_fw_dtb = x0;
+	else
+		nt_fw_dtb = x2;
 
 	save_boot_params_ret();
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
