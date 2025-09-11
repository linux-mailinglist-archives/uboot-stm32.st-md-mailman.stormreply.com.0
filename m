Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AE3B52962
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Sep 2025 09:00:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66E43C349C4;
	Thu, 11 Sep 2025 07:00:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0C11C349C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 06:59:59 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B6Jewk028706;
 Thu, 11 Sep 2025 08:59:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 uI2bsC92ZDPSCBmprg5nmt0zJeRm59XsQhr7UQbp6EY=; b=7MAOq1ugJ6XJwuok
 2Qj743twJ0CRH1j+xhBHXWlGVUgkCKtHR2b0QkNqy3ZTUeXb9J5lEqONubAUOPBB
 N/9b2QrGj8fNFqDekzARwhxFGhj92O9/D3Z7VIuCsOlUkaEkK1FcwIeJIqiXj6ye
 czNPLljJ27eE+6cHH1N1QztquUIZ5NJrZ99CfH8KHSqaDhRPZKLQUbrQ92E0EaKj
 HtHgR8I5sQP53TPodCkY3JIP4iOV4Z1ZRO90S1qdJiZJP/hTXSRYbyGQkEwSe9Wi
 8c7ZTFDeQJy1wHp33orfutXC5JZ8T8UuXEc27s0iv0/lvgVkJNvQBApWjPb4PNir
 vy/Z+A==
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490xh21qw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Sep 2025 08:59:55 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG3an+s941sDKvATheIVw1EpgkF3f3+epVsWIouTHPoOvXYWorovs9/bC0CuRkMQvMeuHtfNQ7lCps+/u0618JFfN6zEicPZtKsBVjtEp0NZ/7mEHAyzGtJbH/Y/9eOaSvOZ5kqt7CxZAd/cu5nC+DXol2V4PqHPDUziEex0r1HvQdheVWOR5ksGpvhniPRmC9KhNyTTzMcyQhDU4IYpniqgg6cCGm3E1D2HtKiDR3IcfsJt+bzl4Iz75j8nNWEjcY31XTXDo+HN0V985Ls1SXseLY2wAC6k5zqrwuMAxDj93geim2nhSDYEvjbTJeXH6Sm9993yRatpteKqk1strg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI2bsC92ZDPSCBmprg5nmt0zJeRm59XsQhr7UQbp6EY=;
 b=qWgkWJoNi1OEHIXWbsF56mkBQa0lgqtplDiw6iyJolUruQBF7ekeI/6CgCxDUQuKfjT7WAkP2cSyYlFPiBwAV3EI7fVs6/w2uCBnrZoKtze0v2rtyz2qcNhxf2Ig2/2KQz5+7xcFiAN8lq6Oy28vd0lks37nQFXo2LBxdWitwz/rMgdlNfu+m1Wir+3tynsekAf06C1xk0BfgJNyQSI/lLxjXvKkVU/joaaP3hUkOLMGqsZV1IO/2eJzhlMy5iSLvkNbtE06rV79KZD2PgX0vDL6l63mKwfXr2cV6Jx5jestkTM36k5/goixmVIa9zyr43x2OL1pjmSxLevsviL5BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uI2bsC92ZDPSCBmprg5nmt0zJeRm59XsQhr7UQbp6EY=;
 b=dFNsiXSbDxCKZeMDnbpX+GQmY5k6DzOJfB+gB5+5l9zo+HnDk7RDiY/Oy7WPN7vVYqDJwjJwoLLmVsCzej680gc7c4ml7z5hfE2ZIGjUA9TwxkLhRhoEKEiaehaqC5lEOFAPuA0oqxTwm6oI5ULyNdq74Ig1Q1Jh7l/jWdsNFlo=
Received: from DU2P250CA0005.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::10)
 by AS8PR10MB6970.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:59:53 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::d5) by DU2P250CA0005.outlook.office365.com
 (2603:10a6:10:231::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Thu,
 11 Sep 2025 06:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 06:59:53 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:52:44 +0200
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 11 Sep
 2025 08:59:52 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 11 Sep 2025 08:59:40 +0200
Message-ID: <20250911065944.15020-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250911065944.15020-1-patrice.chotard@foss.st.com>
References: <20250911065944.15020-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|AS8PR10MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 429fb9d3-f044-4b34-8378-08ddf100cf12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qGvkgYzusHIgmNcws+6GMLGQrZJI5jzz+kmaTYfinevlm/RbtcIvHWSCz47F?=
 =?us-ascii?Q?Gvvh+NyMBebUxuupAeiJ0+3IOEiUO+shuWBbk99W16KFoKaPaC6Xn6i11TKQ?=
 =?us-ascii?Q?g4pPGmrfhEDpvLr3XKT4A6TbGhlogY71PsMLaHwtMY4n54m7zpzWLoanA5Jz?=
 =?us-ascii?Q?e03Lc+kXMIUuljYCcQA3IZgLhdYY8JYa3IzYupq+HrzmOsNMcMSogPhS21DN?=
 =?us-ascii?Q?WXltfmI2p7rXBMAC46F6xc3mCqQ2buOR9RjzHoAzwZDCAbR1nhYjPccXIYQZ?=
 =?us-ascii?Q?Fa13ByTrcm6lTjB0Zn1gFSVD/ZtjB9slsJinm0SjB5YOXPCWrt85cCCoTED6?=
 =?us-ascii?Q?ZxG/WxkYkYMqrZlkHubCxTgek4uBurAMDPPjPwVwyIr06oAT56hXp9VndulJ?=
 =?us-ascii?Q?B0ZzI1HDKEZMz0NBfuVA4/C1R8iNczFoeY0mkLN/ovjjFYXksK0lNjPPVL3H?=
 =?us-ascii?Q?WxJO9/tj8ly48ZM/EzSCTxVmFpnGuCQUI1naHImkSfcdVXg0mzfS//l762J1?=
 =?us-ascii?Q?4HHZw7Mt8Q7FSfuMLgZuSm6JCSGpDcJ/qJNLq79nAtZLtqVIYMWJErf1HNoT?=
 =?us-ascii?Q?52RHKrM4zHzyWmC5oEzZCTNySrmHew8cJXwg3Mz2qhBigvA5q6dXLM0JHBm9?=
 =?us-ascii?Q?QPZZcbkq7Pzaa3zhXXvO/8AbMzK+62jynyO4q1kTFC41Mjr74FS8OW3D87wH?=
 =?us-ascii?Q?/8X9s7457romvvC3vmZ62Ew1HX1rzGdInM5K0KvDhM7T9jeXm55uGCCcB3cB?=
 =?us-ascii?Q?XJasCnz/K50YNX3YcZ45fJumscMEgHVnIH46aIcAk8mdbIjuk9s/6Jgb+niE?=
 =?us-ascii?Q?J5O+Mud12PHYBz6vOUGNuI58PcWMY/Hg2rd91XbEWHmUoPI8biS6IBmxxldA?=
 =?us-ascii?Q?Grs63OFWqqr2v3G8mXvDRA/WZcEp37VTjaz5e7uD7nbE0bm05l17hvKxa/IO?=
 =?us-ascii?Q?ZG3hGkxP+XhXF/MP4CQKPOhvO4OI/PDOm+u330Z3uheWJEDplUHEuC+yEw1+?=
 =?us-ascii?Q?VMhhXe55kC2kGsbUm8r6P0Pc/aLvQjSm9O2D5hH70ditPiNp/f2DgtiT9jsw?=
 =?us-ascii?Q?1YEWY5UA/D7QxVawOCShvUrscf05aX687qj3N8H1XMVNXplWdZacaeCfEFet?=
 =?us-ascii?Q?F4KB/3g9mHjvezQ54dievbA1xuvVGfC8yjURMbj9EObHl9FkKX9HNTD2brEX?=
 =?us-ascii?Q?gqaPFtGDZ5HRo2U5zf8pGsL9+idjPXeIOdPH6YPuGvtvKXRVHQkIqYIh2Y/I?=
 =?us-ascii?Q?cEcuZ6o4AyVBQXm3qsaeCm06P6/BWmH3OnXa3VWMPO6bi2B6P7I+Dt835ckO?=
 =?us-ascii?Q?5C+4zYX58QlVVrCJ2CEIax2XQ2NFbsEcdMeSXJzDBgmwDt01q3T4mYXi+lny?=
 =?us-ascii?Q?1SfeavU8AObP2a8mIBSNXGlUSLe9L3hK3je2xQ60oETuVpe89ZdxIXPREnIy?=
 =?us-ascii?Q?qVdXF3Ys8+cs08JHhPoHricV8Rh0iDK4hmZlcBUzXRfnRcHhNoXF3A8LM2qm?=
 =?us-ascii?Q?LvHVrqC/r2HeUz+2RRBmo6aMKaU6jmqhvAlY?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 06:59:53.1723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 429fb9d3-f044-4b34-8378-08ddf100cf12
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6970
X-Proofpoint-GUID: 0KReLU9V--oSFh2Og1Vm8tOmkKyoSGfr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIyOSBTYWx0ZWRfX4SGgK/lTgUNW
 JYSAGIsSEObnbDuiHc/Ybp+wqTjw4aUbvLpVTFh1V5L7Q0TQPE05Uq6xBZ6h3A0KspAnrpUGPQv
 zrEVjTvj1v5+ZSfhbG1lc4yxFeOG8tvKdJ+g/3NGP6swp7GQHvBV5BIc0dDtASwQJBMe6v4nNff
 QLbUfxYmAExCJ/ijkjmVFIW/noz2Ayn4KpBETFvKLq2hRQ1ddopOV/gXbmIyt6C1w5NoRjAiePv
 fz+WGDZqm+drLAXzfxDkmPNoHfnC4XeZD5zpnRAIvy/hQccXjErgVGDpfrIS83M+69VG3/zgIsw
 SdxrvCvcJfaTBf9r8uSGhdeB0UexwrcQD3jJWWntrfV/9THMx+pUyGfrskVhgKnfmPilAAqHVPI
 RQgVVkVz
X-Authority-Analysis: v=2.4 cv=VKfdn8PX c=1 sm=1 tr=0 ts=68c2736c cx=c_pps
 a=CMR6WCwFVgkdWErP3uM+ww==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=yJojWOMRYYMA:10
 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8 a=YDWbNGI0okKjsywA8e0A:9
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 0KReLU9V--oSFh2Og1Vm8tOmkKyoSGfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060229
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v2 1/5] ioport: Add resource check helpers
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

Add resource_overlaps() and resource_contains() helpers.
Code copied from kernel source.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 include/linux/ioport.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 85288c3729a..c12a7f70ad7 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -135,6 +135,22 @@ static inline unsigned long resource_type(const struct resource *res)
 	return res->flags & IORESOURCE_TYPE_BITS;
 }
 
+/* True iff r1 completely contains r2 */
+static inline bool resource_contains(struct resource *r1, struct resource *r2)
+{
+	if (resource_type(r1) != resource_type(r2))
+		return false;
+	if (r1->flags & IORESOURCE_UNSET || r2->flags & IORESOURCE_UNSET)
+		return false;
+	return r1->start <= r2->start && r1->end >= r2->end;
+}
+
+/* True if any part of r1 overlaps r2 */
+static inline bool resource_overlaps(struct resource *r1, struct resource *r2)
+{
+	return r1->start <= r2->end && r1->end >= r2->start;
+}
+
 /* Convenience shorthand with allocation */
 #define request_region(start,n,name)	__request_region(&ioport_resource, (start), (n), (name), 0)
 #define __request_mem_region(start,n,name, excl) __request_region(&iomem_resource, (start), (n), (name), excl)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
