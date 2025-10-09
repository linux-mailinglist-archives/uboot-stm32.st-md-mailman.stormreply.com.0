Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0F1BC9356
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 15:09:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1742CC555B3;
	Thu,  9 Oct 2025 13:09:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89979C555B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 13:09:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599BhcQU027803;
 Thu, 9 Oct 2025 15:08:58 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv69m6v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 15:08:58 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NejYvqoRw7LWx9QaBOIUTWNVWwAPzGEXuRO5+b5H6ipD5kp2wY+olh8yk/DhPKem3fs0pMQh9bg0TEKAOAgy1f8ASs7n8GMRE17wtHmi4HC/xqvGglrXe12MPwLsRz1cr4/KEBZ0L40rYTXhKNdKIXO2OTVYzZ9g4AOEcG9X5Xc0dd9S3+Nur5fFCgBCIu6bGS7awF/xk0Ls2OaHhos6JxuV97kC1wEuCp36EqW0WK2W309o6blauh1uGpst6YIf/Pk2MBZFFxD0f5nrdCfPbmNzV6jji9jIURB6Lu5HtsiUuAdIsNo7ylkmdfFICcWrWLm7/HSJxJI0OTqzl9kIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uscmN+6jYMkmNvsgWsBFvvdH+hXh8y5SoJQ8UAghfUg=;
 b=BeXe5jN4LfgsA+Ov2V/SB1tIzakyC/n8rD1GOVH0roZtol3vt5RghiIQU6O7f9yFYoTMJ1PgxQ5270O8t9+d3p9Whnryi0XGe8kaWR4xkIPOMPQ5N+cJ636FuOjgHa/pZ93wio7r2Lq99nc6MHhFUECiPpfeLEC1Otc5Qp/LZQYWQv21hTYmid8ltzRRXCDo3hT40rMNPTBTTgGv5+HhYSK/U5+ZCGCxJcSjJ8IDcKH0kLMBtfB7rcEYhu1w90tcS8/+aGMIgufrd+nBpVnaVLmzDjgY/8KPnwf4YFJQhOrkviXXIWjFcF7f+U0SZ3LabNwSHg15G2O7ahEGAXuLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uscmN+6jYMkmNvsgWsBFvvdH+hXh8y5SoJQ8UAghfUg=;
 b=cOrUNqISC/lifwnhefE+NZeYcUTXBBjR7njConWOoVIF9w/F8pV9kGs6BE4SKu0jUhDfkS7IMreudoKVxm6dAO9D3tEFGjNnuBMWtxqfk/pafFTW+JY/atGfresrSEibyo0XTavOORzRAgCm8Z/1c03CYwgxQa3eCCncGpbv5JLUnrSn9nbRW1QVnGfioO5StUAGT/jnYOV69cBVtCppjZh6QG9iuLHqc6qFFrAIri8gIgMlUZY3ODHc76zHukydeXDLWS+VM6RqGt+Grlmjyw0UKxvRNPVefALPmBrfBY75CAaC5FXkxXmOP2UEN7cGzADM/GKveWmLzZ4tpWZJEQ==
Received: from DU7P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::26)
 by AS8PR10MB7807.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:63a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 13:08:52 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::78) by DU7P191CA0016.outlook.office365.com
 (2603:10a6:10:54e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Thu,
 9 Oct 2025 13:08:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 13:08:52 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:06:31 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:08:51 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:08:34 +0200
Message-ID: <20251009130844.11703-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009130844.11703-1-patrice.chotard@foss.st.com>
References: <20251009130844.11703-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AS8PR10MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 4979aaa6-6112-411b-b764-08de0734fe70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5DkjB+kqQfkWXidz9IQR2v2Uwis6DEWfrxaLn9bz4y5Z1gjoU8eYUVTxC5HB?=
 =?us-ascii?Q?riKiru8TPwYLCPv0aQui4u5Vh1sbX5Fn09IrpR0ujaljlRuzsJsNtY8n0spI?=
 =?us-ascii?Q?Eo5xzD48kveHPiUCAYSacgPXuhCF4je2yg9Gnqmx4Px+JJv+g7nBtASaba6H?=
 =?us-ascii?Q?+mK95xmDxChX+LErEgI+ykB59++Nsy48HXQi2zK+dwzhoV2wj/534/Uu4eBF?=
 =?us-ascii?Q?wqvJiND/RvSR4O1qVT4EjD00Dw8HpPSr5S672BvYfqOSEJX8eTFSiaCB1rKs?=
 =?us-ascii?Q?QZludgpl7wu/GHXBMKHwU60eUOQJ6NSAibMA2JO9lquBf7XGT729aF3c1u6i?=
 =?us-ascii?Q?BubIQ8y24sa8nHVYZ9zSJwU8TQzucUYyVfPIBkv8diryKo5Qq2ne4D7XWq/R?=
 =?us-ascii?Q?okAjGZ3flO3lp7liVUGexPqgULB3ptZyG7jAhgyJ/FOss1oD5Yb7WS2E3P12?=
 =?us-ascii?Q?kPQ2OGqqUvc5io3D4c9AFjYkNZ4zMBsLMm9pRBN9Nw1zYIr23bB+t+11KZoG?=
 =?us-ascii?Q?jpsAxDApKQf9Bg7LJopvFV+AiFjmDObeL+5HFCtaUFvX90W9MLBfUKCE17vn?=
 =?us-ascii?Q?A1auJPGW4IGz9y49OP1OQ3G3+yjCwaunIOgrBOjTM2RrxEadj72A9S9G0yZ9?=
 =?us-ascii?Q?Z1H2W8w9ElCtEOH0cArgXD+JBU++H5y7gC5JuA0G/FdkK7vo1pDzDYCaEzF4?=
 =?us-ascii?Q?k+dijrbLTzPLe63lTSHjTF1rJI9biolsi0N+IgALLd4hB6cV8zhth6uJlwGV?=
 =?us-ascii?Q?HubneKZl+Z99WdGO6iQXiSHSUlkzFiVagVPOdv/DQ2HMkKSEfua9l/ZlIJ64?=
 =?us-ascii?Q?ZxZzHGEAMFDcVfPWXHS6njyWpeaojmR/QGqHJdGJp1GJ50xSGhQwVT20qwU+?=
 =?us-ascii?Q?e95Tvbul0t9TOmtHegMe2e1KhJXStrNoyTqTE+SEkw3s54QUAh0xY2B/0oUI?=
 =?us-ascii?Q?j+IeGjlcHnYllAnJf3JqPndR52MFMneiQqZsJ1mMgtKmpyo4v1YqQjnvWAHV?=
 =?us-ascii?Q?oXmHOhh5+NBR7gQWYKESVNDKCPCXSwVgcy0x0ATq1804SaqgOpS+DO86lJXv?=
 =?us-ascii?Q?3LXek6SkZkmbT4nB5d86+yZbgA4MQvIyUxV26q9zsMf7ciE1sy+UzsUSNW7p?=
 =?us-ascii?Q?5Snrr0dQVvdLodyumns57Rv6wmrHftXQ57Sn6qUQedE/S+6vBgf8ZQ5v1d5D?=
 =?us-ascii?Q?jgR3hKPLxXh3IsWv+6RnOD5JbiqBkNoQeCax2nk76PY09mnCahtyWdqtmN7L?=
 =?us-ascii?Q?VrmLAt22lPKfLsCPodbjIhlGuJg+i93BW2nNNCNwsflxrI5JOs11+o7bgDTL?=
 =?us-ascii?Q?zDRPhWYhAfVMHj51+k44KoBNNBVlos+VL3Dyc7HO0l5SnDPlFajZX1BzUooZ?=
 =?us-ascii?Q?GpipwuYoBeEDgO3B9nOnfuMuqOC9ZxM738te+WzB691mDzDmxALBJAhmA925?=
 =?us-ascii?Q?UMh9LNAYnZhh+wIkEd4k5yiUjJBSb2sLAVoOEgYyCn/8RmK+dubYLgBmZXwn?=
 =?us-ascii?Q?uBX5Y3zp8pXcpjsB/Q/fUxCCZP4ZibLQzeb0RCp8002JgNPWK6I2e7Ixm/IC?=
 =?us-ascii?Q?cm5JNshOTAHj27RA/5I=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:08:52.0542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4979aaa6-6112-411b-b764-08de0734fe70
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7807
X-Authority-Analysis: v=2.4 cv=F4xat6hN c=1 sm=1 tr=0 ts=68e7b3ea cx=c_pps
 a=72xqw1RhogTSgj5qdGKHVg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=mK_AVkanAAAA:8
 a=ljBBNDxBHGRvMWwOmYMA:9 a=T3LWEMljR5ZiDmsYVIUa:22 a=3gWm3jAn84ENXaBijsEo:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 9rCZt766xrK3fPK1QI8Ej05sOdqXn4fw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0fmxkngrJAbt
 +Cyx9USk0DADcSMc3mSMIrf5ARIgWqQJp80TYyRKgfGebEltHEKM3nIRpwd+W71o3N2DEM4O6FL
 Lub/Rpz2bvTqpHOmU0KXd6HZx12k+5fGSidy1LViowMkn6GzCr5GtU5mTDpk5OnM4VDXOb/pmWl
 7LyUGy1JM1+0dn5e6B5Bermyz80kTqEmMSUan+ZSr1fEtncvaijpKQaT3rnk8+BmNibAwcU/BVB
 A47CzvmKkGCW6s1q8nJRn6EG9Y5pBrApO5zKRGKT3ANgheaPB/mbE1yPI4Vu3hUQyfNRhuXMrxc
 JdVkdUYPYgupTTbLSJWupa2yKlhmE1igAdKRFoazbnMPPTmS9++G2uCAVTfbXfVnFJT2bwW1PBo
 d3BxdCRlDQv+d8YBvOnVtLpqmFpTpA==
X-Proofpoint-GUID: 9rCZt766xrK3fPK1QI8Ej05sOdqXn4fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Yegor Yefremov <yegorslists@googlemail.com>,
 Christian Marangi <ansuelsmth@gmail.com>
Subject: [Uboot-stm32] [PATCH v1 2/2] led: Add LED dependency for
	LED_ACTIVITY and LED_BOOT
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

Add LED dependency for LED_ACTIVITY and LED_BOOT.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>

---

 drivers/led/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/led/Kconfig b/drivers/led/Kconfig
index c98cbf92fab..7ff5cefd29d 100644
--- a/drivers/led/Kconfig
+++ b/drivers/led/Kconfig
@@ -11,6 +11,7 @@ config LED
 
 config LED_BOOT
 	bool "Enable LED boot support"
+	depends on LED
 	help
 	  Enable LED boot support.
 
@@ -22,6 +23,7 @@ config LED_BOOT
 
 config LED_ACTIVITY
 	bool "Enable LED activity support"
+	depends on LED
 	help
 	  Enable LED activity support.
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
