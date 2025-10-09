Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96ABC935C
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 15:09:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C88DC555B6;
	Thu,  9 Oct 2025 13:09:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4821C555B5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 13:09:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Ct9tk021987;
 Thu, 9 Oct 2025 15:08:58 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv69m6v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 15:08:58 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkTFSdc6Rhuk52Vf1CC4352zGybjqN0hH6cdueRjLeDiiq8MncQo5FGpRhHjMKZTHi7SQHo+KuDH/eyjDPxE+MS/ueIzY1XbzIl29LYVtrmreDtN/a0KNQl63UjWX1wPZQ5M/nREVxIimsrfi0I05KDhyZKgErw+IKbNuf/mRFRyHZ3CMq32KINPqJVw+y3hcHAp5Lck/8dqISnbsLta+ir26yD1e4mvpooGcgWyyQ/irawhv0IdEy2XHBS0nPhvKlJgiJiKQzHmBumhnfbaMUJiLlzWbxdR2aRJXmaV4chVC7vq84aCRhHEgN2OGu+4nf36uaNDLUh/yhIaxvClrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKpLWtf6Y3rv0komC9foUh1QaH9iOUovHWIJ+1Vlb1E=;
 b=HNslnF0xxUAMxrxab27R9tCvTjkrwNLX0v5+/kxAJEE9NGe9mVVvZB9aKEP6tdwK84PNWggZcnWGA4mZAE/e7Tm9WIW+QrXnaV6S8dvQe9DFU15JNQIgFtYe6RyfD8xLPEdeqxfN2Rt2QtYm3ME92EKkU9WrwIVWeSxepzJQfNYy+6ffOw85qGNS94wYFDw/dV19CM+5BRduw+s9830mk4osBahNczAf7ydW+vZpH2ucnXpr2zxfG0aSp0hk1o9nZ905Af6g3O/QobY5HZrfPHTQgnUITtC0HC5iyACvFUinwxykYXtuGLjTBMHlldby5yfT/AOcOib80/mHvaVxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKpLWtf6Y3rv0komC9foUh1QaH9iOUovHWIJ+1Vlb1E=;
 b=aq34hte6fShSYIKqY6pb6V4IIurRnFDNnewmYWKXyBd7HRclizsYduHfMGo4U47B4/mBNEtBxrQ4e29POWbqaZQdLtpjd2e7pBZZJAjU3epyzJmDxB943QGDiT9Qpo5rrtrQkTzWU+wLzEqiXjKeOVAsOULR1TeQOwn2PAjiKTjB3+zc8Whs4jxplRGr1BhRAfuwzXOrQGjMz4AePEcF0dtGyXTajc0/+uZ+lrKXF5yDwgfj15BOsqRWZDQIWNAaOhtVrIS+IpOnu1DREGGdbq3sMzwwBj5z1ntFuCv4t4I8yYZkZEWeT7Zz91PSoVaNyYPwaPT1a6sLl+CPUKC4iw==
Received: from DB9PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::8) by AM0PR10MB3332.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 13:08:51 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::20) by DB9PR01CA0003.outlook.office365.com
 (2603:10a6:10:1d8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Thu,
 9 Oct 2025 13:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 13:08:50 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:06:29 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:08:49 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:08:32 +0200
Message-ID: <20251009130844.11703-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|AM0PR10MB3332:EE_
X-MS-Office365-Filtering-Correlation-Id: d8246a88-94ac-4758-24d3-08de0734fd89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WfpzgJ90isvmbDLmukVfi55pDIS5ANUHfk7ahfvGDpQ6qBWPut+F5jdCLs9U?=
 =?us-ascii?Q?PykqtAeKbKQ1PB6RuPiVV3JRjyHxoHyKMDDgDEyy+8CCnPtJbSQU4EBMeNWr?=
 =?us-ascii?Q?uh7kEmExri4GWQFIYW2BF93k+kqfbD/a0lN58C2MaTna0GqZl9tYjX/zbs8e?=
 =?us-ascii?Q?qFM6EzgVIs0f/W3/TCRi64jCwOnNuc/YVwJxLaNfA2topVIeYpQLy5Odj6SD?=
 =?us-ascii?Q?e83yHyfH0nqUlRGmnwwRxYl1cjswL4TQWtUcCaaxngnAXoJgkw9d4wj78dss?=
 =?us-ascii?Q?wo9+CoVAWDwpbK4bf6wIhUbDkDnlhrBKiGOEJlUA1gl/eI3vxe50pH/d9wrz?=
 =?us-ascii?Q?Te6VocU/aPPdH8wQmn9IaSQ3qgzyL0ttjOE/+uh0Riz0n0hJuqZV6J9PUkzr?=
 =?us-ascii?Q?ii5lP4FvFS8QXQm+LVNbY2qWJUFZlXlyiPXLV7G12azdu4LWJWS767pT9bvd?=
 =?us-ascii?Q?xyS2gvWGjMk6sCMMrUbcpOcck3GlxWQMGrK7u2wLokfmPgVIRlD3K4E6KDxR?=
 =?us-ascii?Q?8Q7w3nlUP930Qj4LvU7I0e1aE0EZkmo2AcnGVdMLPaJFS2FfcTQhFH02HIHH?=
 =?us-ascii?Q?okPIbUbDZtDOoV9Rujk3Lhz3eyJUFTDsYzwV9BvFwCh29EF2YktHnOuyf83g?=
 =?us-ascii?Q?SElG61dTWs9QUTM1m8IhnitmA/vbZErzk3rwutEhNUA4EdvMjYv40YABifm0?=
 =?us-ascii?Q?QDZJaZauYaZ/RtR2W4hdmJh2G1lpHt0kNsFOJk3PJntJc2ldnamv4GWfmWUm?=
 =?us-ascii?Q?b+0pPp/FckWjGmjL3G8hLSoY1SHA/sf6/uhP9adG61/nouNEzUrXoYrOdjJK?=
 =?us-ascii?Q?op4kKGO6pVrkuZf/ZOBczCrbFe6ANYGznFT9q4yjg0fspXqs5N4fBQNvjWix?=
 =?us-ascii?Q?ZxppNfW69rXRz67VKaQjKz4WmwBG9FLAuFgPm3dXouioLLqi+5exYosLmfhz?=
 =?us-ascii?Q?Gj+rEWbtKIOzwWkptKFHLKKXzl6CL+YJXf2Khb9WttWnLvBTxaiSTyGD7kHF?=
 =?us-ascii?Q?S/5+9RU1SFaOY97uYRHOe4yRRm/chyRtdtjcowzRmpILso8kdoU54cZfw+gk?=
 =?us-ascii?Q?uTL2gC0Ze6xY6kXHZ9V0m5KgF345ASOrY4eFUYArc+PGenlmPr4Ojah3xaZh?=
 =?us-ascii?Q?CkP34ECSxd7cHP79up642Hf3HFdjFQ7aRMQfFF2Zadj6ANXaJJW+mjjFLeAo?=
 =?us-ascii?Q?GNXk59OePcKw4RijIjo3vj/XfuQuRGTTobBErB7OYJY3Rc8itgUMfLwtRdMf?=
 =?us-ascii?Q?kqfZxA/uLpIxwtLjOb6cKI0BAdjYdv8Duhx0/l7owmsy2AgHkQl7yxi/iJpt?=
 =?us-ascii?Q?u4l6jclUA2RE0A2HhEjsvyjTAoeIXvK2L765hRx+Y/nr2jCiXsBSXUtuKocG?=
 =?us-ascii?Q?pZLl/JasC+E3kYdR4eXXurPqRz432oo6X/nvjNCWb5/0E1Ef8zVc4MxKZCh9?=
 =?us-ascii?Q?eV7wCyWbWdhrxv9uuEnVyeuquM7o6KS4l0Dr4XLEHUXtk5gy4+77lylQY7Np?=
 =?us-ascii?Q?5jzPtKRoX7zndODq4hCIamUAwNM4zSDYOghxg1n+sbat2epH9p+eJdHhv59q?=
 =?us-ascii?Q?EHts3ZYJevn8onpfrqc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:08:50.5201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8246a88-94ac-4758-24d3-08de0734fd89
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3332
X-Authority-Analysis: v=2.4 cv=F4xat6hN c=1 sm=1 tr=0 ts=68e7b3ea cx=c_pps
 a=rEC1nn3bwXFCJLmtaBoKug==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=-vo7UkWUKi_qIZtVEnsA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: fV_snPATAJm06dlKRQZjkHPZ1yifqaFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0fD2yPvXse+/
 RmFG/KcMzlPPKVnB3HxL2CH8UapeOU0tDrkvHnfQK3uNDxvtHcLVHCAx6dqvEZr4U8NVaHVEmZd
 7Lq3QH3A3WIpL3ai+Pj4ooIhA0227a8OVyDVfDbs1ywncyWB3kOUOMXg0PpwFw+8R8HP94F9uJG
 buYJ5f1cfBve1ZnPAdVWY1ps+eeUptv8zwz4rJmMSdwJ+ueqva4pH32j+k+XL7p5pGpTSypsUhA
 PJlFcVxnMMZGC9nhogjeMVstWAPKSmgZ0XiFiG92NWiOs2LO7R+JMXHj7BvhusJbQtvWbTU+GWc
 6IAY90jVthux3U8wcYtDirDT3MCuRuOey6a3/5RnngDGvxVDHLlKUKQJD11mDmZZWjfJmGLpJ4b
 QQnJFh+TX3v3qnN4ld1Dfi1/c2fmcw==
X-Proofpoint-GUID: fV_snPATAJm06dlKRQZjkHPZ1yifqaFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Heiko Schocher <hs@nabladev.com>, Tom Rini <trini@konsulko.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 0/2] led: fixes
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

  - Update led_get_by_label()
  - Fix led Kconfig

Patrice Chotard (2):
  led: Update led_get_by_label()
  led: Add LED dependency for LED_ACTIVITY and LED_BOOT

 drivers/led/Kconfig      | 2 ++
 drivers/led/led-uclass.c | 3 +++
 2 files changed, 5 insertions(+)

-- 
2.43.0

base-commit: 0eaa4b337336dbbe93395d1f2ccc18937eaafea2
branch: upstream_led_fixes
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
