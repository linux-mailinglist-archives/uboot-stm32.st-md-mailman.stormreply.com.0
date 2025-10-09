Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3A6BC9C48
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 17:26:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C93F7C555B6;
	Thu,  9 Oct 2025 15:26:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 023C2C555B6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 15:26:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EgK2d014588;
 Thu, 9 Oct 2025 17:26:19 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv69mshb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 17:26:19 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHMnCvZ0OxFSKHtjtuUTD/7YxmWmQxO70oogK086vKiey4gV5HLGKWtagr0fR9TYqE3xHugIO41fTkQw0sANiOBSdGFrBHZaMKFfTxeZBKzwzTzmfFDGNN+Tw/U6/Xl1vb45yywrOLV4gFywop6qomZNUPXgR8imngyEqGVdyTZHVHyPAN6mMRorx/Jnrpk0YPnj/PmlC4UiJylbPACZjzld8ods93NfkQVkPP/iCl0MzN7IoKYw3DhdhXWTCtZS2o520ZxQ5U0Sj9IwBzj1m8bYATVAlVqbxrSaEKKlRf6LZ7c/ni1Ztv6U80tuJirlTG5lYOKiTOgkHyXGKRxpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcIFEY/vJ2cMImZbx6xeoDwcjqr0xdOsOJO23dJ4z1Q=;
 b=ifh/7oit+KASGhw1oj3jdYfV1MEIiA89E/ftQjIKx9R3Qhj4hcuD7wY3oODJf98c4Fzx0i8dKU4/km1rsXcOA9+wvvUmHj+nftdun3ClIteBDdPUtTI4ADATrJw8g5Go+9aN6G6iQftVk3TxWDwCFDjKXlozqGwZclLIFkriWYz6NWZ8c6S3DOypx+wFBZrSCddD7QwCNWlxaNCX/eFsE7vKyDZ5Pw3jZll3VHmiE2SdyLt5NInarptAg1decwWECEP4wg1dFl9GyGoHmZKJc/kuMT9pIM9Bk+bxWD6ueXZpIrWu8v3gqbz+0/04rmM5NSwkeCRcQC4KGRChPcIAnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcIFEY/vJ2cMImZbx6xeoDwcjqr0xdOsOJO23dJ4z1Q=;
 b=iMmckym8Z63UKwz5IjtoXMfYNOyWRVI+cuzd3DLxopmM4phwJeYUlKCMhifIS58y2KmuLuc5eTJ+1Ih94KaHH7YHVc59eXxJ5XAwmGmBp9QqkaPj5Q5dqsD7NfVEFfpM0HrLrPDeKE6AMn0fDo1kLCkWhYBPI65k060vMTWrkulYkhtUAUvctPG2vgHuUj9Oueq8drBn1AzGBO1t0IvK/bUAtCkW0vaOF1sxheyvH4BPU08Fw1ZLm6LbJ68czfUlENh5wgxpSvPVYea8HeSLuUURreiJOtMgVhz52eouH9gRgeIPHAKXX9a3Rjie+804YjB7yi90BbGdnCFQ2JGtzg==
Received: from DB6PR0301CA0078.eurprd03.prod.outlook.com (2603:10a6:6:30::25)
 by VI1PR10MB3342.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:132::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 15:26:17 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::47) by DB6PR0301CA0078.outlook.office365.com
 (2603:10a6:6:30::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 15:26:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 15:26:16 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 17:23:55 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 17:26:15 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 17:26:00 +0200
Message-ID: <20251009152610.300154-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009152610.300154-1-patrice.chotard@foss.st.com>
References: <20251009152610.300154-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|VI1PR10MB3342:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a08464-0dff-408d-050e-08de07483092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N+Q9HObQufM+hxe+CrM8hwl5NS0s/CXyPqKttkF/1GBVfYmwUgQPh3PR9kla?=
 =?us-ascii?Q?t+asLk07YwDPZ0xmyDSSFvXbYxF7GSeoaH46r5mm4QayBw/LupJGJmxvpkuk?=
 =?us-ascii?Q?18/bBv1b0MWoQg9yYZOpHsuVQtt7kZyxp91eRtv68VSJwTHBzGOnrdF6S2R3?=
 =?us-ascii?Q?DIc0+Uz0f1mq9BniMQQuiCLI3LMMLv/REqK614uVlhqSRAQcpQ431rVSPl4F?=
 =?us-ascii?Q?w2xwUwjuaUwJi+ZpapVTVlantrRmtXNqqDNJNYR7PWCKtNzmp1L6tXdwCOz/?=
 =?us-ascii?Q?EyrzgZ2ys3p5jVPHW7/1c0pIjiuDxS9T6yamhZtsK8e1WVaP/spbJf1jh06N?=
 =?us-ascii?Q?OOWClLFurf3d5eAouKi1Yxt9O91uFVXfi5/5vwy2XLUJTqMtg19LduZCiza9?=
 =?us-ascii?Q?KzpQbpxhzZmFsnR8BvFUG7ZSmvZ/clQ8YfRA4EHe9WmvNYb5Vf24RVrhO7VO?=
 =?us-ascii?Q?0EHJ4VJwAkiYfLV7NI08WETscagXehP5l41MbFyayd+Jyr/MC1Bmz7QjEF5q?=
 =?us-ascii?Q?jNns/JJ3tDpbzCSCkv3YbpGhfD6GY0qNTjpXe+aENDINzWomhrVujYe0Ua4s?=
 =?us-ascii?Q?RfQDPuiCE4NEHlg2pXXrmY6jC02pyJrspZewocGHVBdEV/O6Hyeyf3qjca9k?=
 =?us-ascii?Q?Fo24+YJcevTJvevYwZBWUWuutW41FiwoNgiZ3LMmx8xhOBs1cq8XYFZ9pPVx?=
 =?us-ascii?Q?Siyb5hEOkDc4YO9DpbtiWqAaNQBJO1Dzj69WGy4kpDqGgpsrAv1u5uTLPXNe?=
 =?us-ascii?Q?Om63Td5h6sXDBMMC1XxmxWVmf59wNSYS75oUMDn09AiCdLJeZd0T7fgTD4D+?=
 =?us-ascii?Q?oydG8b9tmj9VARjimzh/M/rJvjTfMqIZ6mHyb9Aggi3FhOuuHgC4Xb12t3BZ?=
 =?us-ascii?Q?KQC392ScwfD0cR/UDpxg7QlMZuvsSWYI9DDN8Ih2Y0UN/MlkPL7tChnm2tP9?=
 =?us-ascii?Q?Fd1NooUgV84Xsrwg8lGeU/9Q+DN1wOy3i7vwkiEQ3BFElJRt2oFG/OnJN8UL?=
 =?us-ascii?Q?m+JMhM3oap8HEjPG9p3krrWh/n/QAWGe5aHpPBFgKKa9Q3lvbcMKkwUGiQed?=
 =?us-ascii?Q?XsYXNTSLICta/G33/dAJwlEqB8E6++g2ucN5PxhfbOm9PXzIUx4F6uBCq2ac?=
 =?us-ascii?Q?/r3Uz/bGZrXZh1hW5fEX4Tv57TXLHklWbWZ926ruttoORO5CbjDG5AOmG2y5?=
 =?us-ascii?Q?SuHkbbXP3K2itgjUZhRe559zbrNTz8Ec56PTCd34V40dAk8HlUxM1W1ThrxQ?=
 =?us-ascii?Q?P9v726ldcFeaiVbUYH85AX+loTRrAU1yGUnjtbB2q2Vxe/0BwRNYm8vtLTzd?=
 =?us-ascii?Q?2A5BrS9kFf++u6IE9Og9CFhRfs7IZeeECPWjZG4fuYLepwtrnBysWmkoRiJx?=
 =?us-ascii?Q?/01M5pBZ0fqDY3icsplXFqoShX62/bkkzngx3qqfMeU5LKj27fOudERZ9xAK?=
 =?us-ascii?Q?gdt20mtfroLu/qdePs9+1ZoUD4WxugUcJSGZXdB74c6xKTGjVdrOxEYxfc80?=
 =?us-ascii?Q?YGl082Hxu/QvRfBrFnMMpbyIMODpGD9mPHEC1QG7Xb2wt4j9Yds99GNY5E/J?=
 =?us-ascii?Q?bx6iJqZFDDW2jPbGSZc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 15:26:16.5976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a08464-0dff-408d-050e-08de07483092
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3342
X-Authority-Analysis: v=2.4 cv=F4xat6hN c=1 sm=1 tr=0 ts=68e7d41b cx=c_pps
 a=U9/24nWfJo5LsBcH4C/8Zg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=VMid92PyRKehKaLCeRoA:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: R0p3_e1V5WvAUBoejnKdMcPKxC1jdvfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwIvxOSKjQ1mJ
 4l2++9pJbJnH675otwiVdwSn5NfGE9pwKuE5A5T5QlCbU5rS5XeWYLucCsnafFNnKAj8AXdOKxu
 imblydl8aIpCRU1b08L3cOiKfcxPONIMNvv0sZz1qKzNNP6sQ4tNVzVfKYWfdqmRW3YIA57HveB
 5eb8sXufu3u+dAieH+E1N4xd354+bXMwL9zc3offxMw/5SMMj+edamKRJN1Ldk0RmfxPnVF8ogV
 gyCRjaW+R2mSMzwnCNrJ7ram7qWovpHxQ11AEA4SS4HdTDcyB4RQwP99LWpeFaYMAvx1jFkzzOX
 5qNBDd7zd6dPJEEZnQorJiAuuMH8iYuXLquvvwZbqw7ov42bAyhh7MmLoNPzsCRQpXF7xN7yDXB
 2zezfppU+R9SNxtdYbXm3kCGADHrKA==
X-Proofpoint-GUID: R0p3_e1V5WvAUBoejnKdMcPKxC1jdvfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 3/3] ARM: dts: Add st,
	adc_usb_pd property for stm32mp135-dk-u-boot
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

Add st,adc_usb_pd property in /config node for stm32mp135-dk-u-boot.
This needed to check board USB power delivery.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
index f004e9840a2..326a8f8736e 100644
--- a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
@@ -14,6 +14,7 @@
 		u-boot,boot-led = "led-blue";
 		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "u-boot-env";
+		st,adc_usb_pd = <&adc1 6>, <&adc1 12>;
 	};
 
 	gpio-keys {
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
