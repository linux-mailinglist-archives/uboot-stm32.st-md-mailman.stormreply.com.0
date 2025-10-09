Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A73BC9359
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Oct 2025 15:09:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22812C555B3;
	Thu,  9 Oct 2025 13:09:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C30ADC555B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Oct 2025 13:09:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599BhcQT027803;
 Thu, 9 Oct 2025 15:08:58 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013049.outbound.protection.outlook.com
 [52.101.83.49])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49nv69m6v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 15:08:58 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eR2uyWI1Lk4I6if4Sqg+w7DxqUIop+Z1N2uBI2GxQY+oUR9VGZiEMVFyVT2968uOGriSeK4g9UL/dyqjUrFldHNp/ggseJGd94WZj6UdXL5+tHgtMgPkpSc6zYhm+D14dvCAJnO0VwjgjQBT0zUGt8TuEJB6ImYX7bQVpC6Dlqcr7Cl17YjdsEriIz8gBoXW3q7n5qqTiopkFQ3D0ZvsZSEifo0AGmQ3s/8WyzvekPmKFmJaoYgApVt/lCGgOQYQ4qzVWR0qq7FNtphqYXFYm5UPoSLgiE3uBYcAmDVUJbo4cHoPKE8ar4GCO2n0PwEJsTWgkeiMJCe50uw4ACpqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQKZCs8aPr6XtgQ3HVwXzk6jMOZ15ShYZ2lb9vJuvRE=;
 b=IYdwTBvp9WGiefOEuDHDabki7t/wJdmiAHb8jPsdqXkt+dNT6sNG2EvwI00jyraiEzbDQfyOETY96Jy1or9zcHXkXB4PeOMAAf43VhFuzjVUxR0AcLIwkO5HyjSFf5pxvPLoeV/D4xGC3167DDIgkQNGgJ5W5gorpGm/B/45PxcVtGy0PmCofoqn4XBC4IYalMAjkl6wyTxzgvyEIkZS8FqiT0fM3G8OzpROLAxx7VW92bt0CNUASpliQXbq7rPU5gW1mRgvbKUgy7T0McwUImMYa1KmixEAiQ45SzAkXfKEroKsGe6Y/5OcXveic/t2ozb9KjAuQhCvjfzntaM6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQKZCs8aPr6XtgQ3HVwXzk6jMOZ15ShYZ2lb9vJuvRE=;
 b=oAfcjIb9PC9SEr2kj7Ilh2BPJIXdcVrfwta4t1dMgAVdjF89nn353yA212VBROHmAXvwdalFLxJfmGcKwXwUZeCTIOWDn57mEwGcZ+xhRWbz0gsZB+WnncBJ6WmftseOPMZUY6y4Bafqib1SXC/YacTlm7Wfg1SRXpX9CWt5R2rKTNuravfU8oCisrlicHeneyKgccYall9jt9rZRtNJIXGFRWUr68CM53sM+paevEJCkX4uuPEmxM8LA4fzwSedD6TiaGQBRKVUUKxncttVJMpXskwLTnr2+D1Fy71reS7vikuAI8px/ZZdMHatgXar6deW/6KZUvqPzC47g+JrKQ==
Received: from AM7PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:20b:100::33)
 by DB9PR10MB7122.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 13:08:51 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:100:cafe::11) by AM7PR02CA0023.outlook.office365.com
 (2603:10a6:20b:100::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Thu, 9
 Oct 2025 13:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 13:08:51 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:01:42 +0200
Received: from localhost (10.48.87.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 9 Oct
 2025 15:08:50 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Oct 2025 15:08:33 +0200
Message-ID: <20251009130844.11703-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009130844.11703-1-patrice.chotard@foss.st.com>
References: <20251009130844.11703-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|DB9PR10MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d4e7df-7840-4b59-1cd1-08de0734fdea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?okp6ALzqfSlm/uo47QCXdnMctJHyRsogkLZLXm7nYiPRiECEHVFIKeInJaeY?=
 =?us-ascii?Q?crgxCW5N6V9KKWtQubcjWgt2eU2umXJgDkSkb37gbhYILRMjJ2pIEVv5MuOE?=
 =?us-ascii?Q?j7FVEB/12mM/P2M+uMwU1RR6MPaLHf2ex4GQh7kdWaFzpiyRDv1IlGJbPzpO?=
 =?us-ascii?Q?GwbsU2eLNuqrToj3IUPCShkfAqHRW7u3gb9dyCwiYDgU+XcrYTW9ZXBmf8Go?=
 =?us-ascii?Q?gYjBUCZSNKfvr2w9cMn3KX+cj+/D52xHsItoAl21CJ3s395l7z4wykmT7HeY?=
 =?us-ascii?Q?8ylI2wlQT5POzQ/zYl4eKw4U/hiX9uqfDBiAuamri/rItEcVRvLAR158pM3v?=
 =?us-ascii?Q?+t5wcechW1mkcNnIbgyf2yNhGCNkVaw5DNSS2td+6pW+PB3EvFiz5q0HlXi9?=
 =?us-ascii?Q?h6cdoDbMyvseMOcFau4T/qASSWTy9n9+nsWsUxPcT1fJTigQPL6iIk947Ul6?=
 =?us-ascii?Q?xmtxMYg0ukqRq1mN3rvsL8rO2RTWjXyT87IBMonXyely5dKvDSJevgm7frgZ?=
 =?us-ascii?Q?HPMZ2iWYsmevsvQ14quDquKzTKFszTIWa/YK+lhia6DjMbCf64X92y+A+a3Z?=
 =?us-ascii?Q?z0G59mRm+1/3POlw1x3jQQRRwt4SPNnEnflhMZsMiTWJ2gej3WURnAjd+6w9?=
 =?us-ascii?Q?CQZynVbplj6IX0GGk9WseqlACBFEKMjwGp1re5zOBJtq8XE6Tx7J3qJY6kqp?=
 =?us-ascii?Q?N7DQIevJXSj212MMz5AaBR7NKnEIDSN07E0GPZrskau8hFR68IOhTXMSHdab?=
 =?us-ascii?Q?Mm5cJBeQzNS8ZoLBs49SRK9hqW0Gq7zx5voCBcL9e/darXBb8kX5wxsVB1I8?=
 =?us-ascii?Q?rgl5RIXugocmzHtMWpRChQg0Yij0YeSgSXoC9lAqEVdQxCshFrWjfh78iNa4?=
 =?us-ascii?Q?DgtknNItermIpGybIIuclIVzN7d19XogsfWGVrzJGjsgZ7xOuPbxMFiIDqOA?=
 =?us-ascii?Q?lejI9l6rpBdo/eqj02n57m9O3Y3dJnOGjUExcbnm53o/hvwTB47M/clXX9bw?=
 =?us-ascii?Q?t/UuxiQpGmcczl0LFEy/stdkfsVpkK3kUFr3COAee5zJV8kQQ4WiGMZNhnyA?=
 =?us-ascii?Q?5lbwEaGEHcSrqsQj7dwCnM/IQJXnhr/+ybXMjWyubgjZS4UQdrIYj/x52RG0?=
 =?us-ascii?Q?t+4qKJ+ZfADYI4XlretdQXPy6g8PdLDieStUf8hhfCNvjmrbFKqgu/Dbaqje?=
 =?us-ascii?Q?5JVOub7Jm0aHayXNcodNCKPG+JQ1XyPrraKujyIaZvZK85nwXKKxXWEkdd6/?=
 =?us-ascii?Q?6MNVmYUsCg7ge5BRUHZVVAwo3Ur9jdxx6ktp/afQ1HS82ncXrcNixEDysMYQ?=
 =?us-ascii?Q?7y+QQKdcmNukal8Lvk2vYyM1eTtqdFjTLkQD5Cmne+Kf7xzuFB3O5TlQfCku?=
 =?us-ascii?Q?3HDchrKAkBcvO5rT4G3ysohKN+MdN1lAQ3132Dx6Ybuj7QVDXZuk/9yIHfOa?=
 =?us-ascii?Q?SIpiELd+IcCt//oJvefBLKCPMmYX8KTAREyvCgw6+lzwfJiqwxmmIHB78rkp?=
 =?us-ascii?Q?qurqTQaV4eaMQqhTxaO5kV4+IEapqQeaAfFuEbI3n5UppA1HQf4pkzcNMz3X?=
 =?us-ascii?Q?8uC5i+4MVRKElsYJvEQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:08:51.1677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d4e7df-7840-4b59-1cd1-08de0734fdea
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7122
X-Authority-Analysis: v=2.4 cv=F4xat6hN c=1 sm=1 tr=0 ts=68e7b3ea cx=c_pps
 a=c6obLYtgja0dDRtTJKzh7g==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8
 a=mK_AVkanAAAA:8 a=lWLQEbMzIy2wC88m7iUA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=3gWm3jAn84ENXaBijsEo:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: W3bGdc4Sp3iPCivPAmuF7fzq0iJoj8A-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwdXPvulGUQYE
 rYQwvjKj3TUDPw775c1s7azTuo4YiSTI6fYWkQNtH/BbI7a1iHOOlQR09zO0vwI7LEPRcUw4K02
 qxgi3tSww71/TKB33VtRmbX8SXKqkncJaO9kBzyIPuRL+m9mtI6IaArM83WaxlSa3Y2tG611MOn
 L1GjKpPN+2SuriwSM/rxhD/ECYLe4rqyOzTZP302mMzrUdtwCh9GwGESS07vVDriHAIq30Q64kC
 /5exkbBRYvJ+BZDyEFnqAGWGvGrrPJ8vrj34wGhvBJvC7pvrQ8gf57Xngg1iwxeaLJvOrxsc8NG
 s8PzM0+uhDgicpDYfHPY6pFOivJAg7EQIlpfZvt+a3r6fuBJGlkkuFwn92ikP2QQEo+UVYcFfdP
 z2ApZeLnDTPYvOyW/ysyIJpFNDwlTw==
X-Proofpoint-GUID: W3bGdc4Sp3iPCivPAmuF7fzq0iJoj8A-
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
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Yegor Yefremov <yegorslists@googlemail.com>,
 Christian Marangi <ansuelsmth@gmail.com>
Subject: [Uboot-stm32] [PATCH v1 1/2] led: Update led_get_by_label()
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

During led_init() execution, led_get_label() returns either the label
property (which is an obsolete property [1]) or the LED's node name.
It can't be the function name as dev parameter is NULL.

Later, during led_post_bind() execution, for the same LED, the attributed
label by led_get_label() can be the function name, as led_get_label()
dev's parameter is set.

During call sequence led_boot_on() => led_boot_get() => led_get_by_label()
with label given in parameter (priv->boot_led_label which is either the
label or node's name set previously in led_init()) can be different to
to uc_plat->label and returns -ENODEV.

Update led_get_by_label() to allow to retrieve LED also by its node name.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/leds/common.yaml

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---

 drivers/led/led-uclass.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/led/led-uclass.c b/drivers/led/led-uclass.c
index edcdeee1e9a..1efdbe272c3 100644
--- a/drivers/led/led-uclass.c
+++ b/drivers/led/led-uclass.c
@@ -65,6 +65,9 @@ int led_get_by_label(const char *label, struct udevice **devp)
 		/* Ignore the top-level LED node */
 		if (uc_plat->label && !strcmp(label, uc_plat->label))
 			return uclass_get_device_tail(dev, 0, devp);
+
+		if (!strcmp(label, ofnode_get_name(dev_ofnode(dev))))
+			return uclass_get_device_tail(dev, 0, devp);
 	}
 
 	return -ENODEV;
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
