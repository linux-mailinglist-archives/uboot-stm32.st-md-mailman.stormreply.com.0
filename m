Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BY/AE06CPWod3wgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 21:32:30 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8DB6C85D0
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 21:32:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=ti.com header.s=proofpoint-05-2026 header.b=BGzI+apb;
	dkim=fail ("body hash did not verify") header.d=ti.com header.s=selector1 header.b=o5hMDZJu;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ti.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46EF1C424DB;
	Thu, 25 Jun 2026 19:32:29 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com
 [148.163.154.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A6D9C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 19:32:27 +0000 (UTC)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65PHiPtQ3933246; Thu, 25 Jun 2026 14:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 proofpoint-05-2026; bh=1Ft6LENgDpQVIvaEIum+iJZRV4BRFis2oiIMKEI8h
 R0=; b=BGzI+apbZlMAhFciMrly8fksuYEBWh2g3igP/SINucvLfQINHmOjqtgxX
 jxBkESA6idzPdFaKQIplY+lUyuiINuPBMB1o4uMasCbcGNRPuYlNWTCR/2xe4cPM
 Z0OrYT/aWHgWAi8XDESEx34A2yst5BkDgLVkxmrGvdUaZPFx9gThZeloFeCEoiIS
 x6/AgtcOUu+gk5Res+ovaOfoOfhTAY/ieuKo/7ZvvkZYQPppQy/VtfAjM3T/1dB3
 +YJw7iFf4QUhksKrJB6UfzgWH2SXViYYKJ8EkrM159xF0sdd14zrRWLi9692v/w/
 2dke/jWU44CSrnn9hvc1U6FKfvzHw==
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010047.outbound.protection.outlook.com [52.101.201.47])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0u2vk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2026 14:31:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXT8kyPj61SSakEJ0SAMEfMYQ8aPPRGXAcOOHDwKfx+WA8GuA2zJ+8dx0hFnf3igE39bHz2siwreBhBhmcBKnsaVBS1HeZ+uk49UZPEKO3qdWJsuf5nP6VNHJ7T0FQUX6dnWgI+/8gj6nPiIVxH1/ckjNfzq4oc3XobjaH3D6HznqdO7yVqQZ1MZCKacwbSHoiZpDx6Q1uRwWicvDKU3GB5aQh0prMDteY62osgyLJdKN742Osh/f6rqJFzvXS9TZQCkozIxsPpAg3U/8ou1GBxIwoJIqlbMGKqjkxABwtxWO5F3fJiYE4VCqSOjTYHSP4ZZhEvWrpSz+NHo4YcV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ft6LENgDpQVIvaEIum+iJZRV4BRFis2oiIMKEI8hR0=;
 b=uSlctaPmMHXdcZg7CdKKdRIuWvnDsl4j6PaKBqiyGuGchysW6uzu+SQ76XH2kqj5DYDFsa3a+5ye+qvEZYBdyVpdeSguTV2Qy5iHnkXRg6H9FdLmewtPv3alUIoG6/WjPaRbeDGHT5OO9Cgqab3Y8Uj3GkzC7FOiDMf9+pURkqNQoHYr02aYYhLDtp5P81p+qA4WyPpM89gbnx44EKkxEV/qunE0+BBaIyGZyYg/q1GNTQoEJO11k8TJ4MF1n1ERw3GQ+MXbegbpQjYoMb40u65ABasG6KQA51Cf5uuaFY7l3ERp6L9fJI5ndeQHag3UVl0SAk4Co6zj6GD8aHtSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ft6LENgDpQVIvaEIum+iJZRV4BRFis2oiIMKEI8hR0=;
 b=o5hMDZJudwy7R3GIGu8Az/zLiK4qXg6mSvvfPTDb5emSDi+PyC+WeeNs2lTPnOYdWKut6FyZo953oXlUP5Dim7GOBy8g/sNrK3kdr81IlMqsJua3ypQibyvaxKKuVS6rMatv2QdjeKaWzbud0sszAff5ZzFucu3CNQaGutVaKm8=
Received: from CH2PR07CA0045.namprd07.prod.outlook.com (2603:10b6:610:5b::19)
 by CH3PR10MB6788.namprd10.prod.outlook.com (2603:10b6:610:14b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 19:31:02 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::36) by CH2PR07CA0045.outlook.office365.com
 (2603:10b6:610:5b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 19:31:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 19:31:00 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 14:30:58 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 14:30:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 14:30:58 -0500
Received: from [127.0.1.1]
 (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.71])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PJUiL33439767;
 Thu, 25 Jun 2026 14:30:45 -0500
MIME-Version: 1.0
From: Neha Malcom Francis <n-francis@ti.com>
To: Anshul Dalal <anshuld@ti.com>
In-Reply-To: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
Date: Fri, 26 Jun 2026 01:00:40 +0530
Message-ID: <178241584091.237007.2298812456813070394.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782415845; l=227;
 i=n-francis@ti.com; s=20260428; h=from:subject:message-id;
 bh=ln7EEOsoNPeFixadr9R2GyXP+pxxk9+jLPuzrEzxPMI=;
 b=Y/36Ybupqpxfx/CMghCizOc/JJBOLMCZHFYdlCIRaYMfIAPFeli50nmphTBZls8nt+ZUr7HEk
 idzibCySmSyC9ORIpsDBd+L04yefulNocpBBtJwVhiLWz9HsDuMGMo9
X-Developer-Key: i=n-francis@ti.com; a=ed25519;
 pk=Z4nV5FmpAM9e1Jk0HnCKOoVUtHW8cscgDRncr2IngXg=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CH3PR10MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 9312cd5b-81c7-479f-2b4f-08ded2f049d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|82310400026|376014|7416014|36860700016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YuEu+eclVvdc1MW9N81kORPout0uxrpdrNRYNMZOQr3JLuHR+B8D9+UGhz+vIhlDIDZvWRGs2ZwpBt8GJq5f+kpCu/G+B0urjEbF4EPgo67bOLlSWnKtgpUBuKfH1KQlpliQ7X6h0d/hbxL0sO0n6uLg0gG1nRDRxwLU4xd6CEaJMJ/V96KizqfL1nwmRU4ySm8ZwKbSCYS/2FYcJ4M7lAB8HvRrDySb355dHaUPmPwMCw17gF3xjD+drA2hBA70GUDcbYeCMHgWHM6trKhOFPqOkBhwOC6f0KeBnbHbjaI/iF9L3MZAIxRrfZ8xYmlZoKWKOF27kYtDA50A83veqG2wqWcPxN6iFRUYR+LPfhRycTdErY6i/MBDxFyMazTsHMJLXVRHyhvgOp6kk0ucN5JENff06NAqtgVPVqZ5p48RF7XXWa5gSRm1u0S9bKv8Ws5k2QASeLZEqU9UwKG0oDndFMVR24ASV5IbYrShQDMH5d7uCi2gb9Bwk3ACdMbDIMI14s33LXM9zGxNXPHOUsXI+Xk0PWPw7seI2BcO0P+uTsf1kGmXRlUfJ/oIvZ5TKEF1JHyG56moNZ6fJ0rU3M3FfyWAN6aWBvvpE+VjjoeEFiAi2jYEg54udcp/378CtjyX6sGlLUorbymyFhT9nV4QCpSrQzpQg9fRddfaeHQvM3Omujx9urXPxTZJtGrvnfSIO/oQ5do0gJJkB6qrIg==
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(7416014)(36860700016)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UdfSGT1dsqh9W9cS6Js/Y+m5sNxERP9WUiyzSSHT2KFlgHGkQo6tPdlf3thIHy4vi0Ckz/QzuuwRi/F0isJFRgkzlUkATv6rjDb0Re3+hBLybvmhyh2gC8TfncG0UYRC9eAjorYnc2ZGO6HZUdsZmZEdyiNA253MTBllxHG6sfeP6U0pjrYYr3dx5PGapXoUURGHgmQQg9c2wkOVw25655HORXlYyQkc857LSjqX2V5/Ki8A/zxxmbNsGSnJm6U4Yl/dZDqq7nGJ3T1fS3XpmTXHbxrVV5LQQr0cHseejBJvJYB9tM/I1sWkaFFkBmLBD/ZxMAp3kSCy3MWvgQ9yBuX6JBHkkHmy630J2aQcCBHRbwu+g5HBgyDJth4Yl7AiWeGmL8TSDTZmTdw2qSqi3IAlnukTooO+CeuKqK3fGNGxmjheRNkJ3cG4r6QKUIXD
X-Exchange-RoutingPolicyChecked: PuiC4NhHsBI8JEpkwef5EbdK7pj0kIBGdLyuGvXt8v4WPJ97Lx3dHt/ZXhYqRlY7ZWPRdKxwQKOSghFh9hQTD4qdGcjm0O0TdiXi4CM21wHr3qjpFZFbQ9wmYLIQjWu6AcZxfwAnE+5F2URJ8B3WMol8B+OdgemD6r2xp1olVu1ac6/AVsaffzwLO6OIS4Na/X/aC+U5wFRdmQP6rs6IAzaXI2h+FI2RTB6yY6UAevzq6LH3KRMe/kq+CGvsmrHtu6PPcvZeyGhOm3cnz+bouR+nhnC4gehKXPL0I0dV4cRtOIEqAP9BVQD3S9udd74dY2jA33A5ddGpFbGzyPqC5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 19:31:00.5167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9312cd5b-81c7-479f-2b4f-08ded2f049d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6788
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d81f8 cx=c_pps
 a=6zE/HbjXcl5L3wBq6eN3xQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=yblAwbMv61PgL-ab2ksA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0OgQbwQw7Sxt5PpUiMsqYz7ScpIscnKA
X-Proofpoint-GUID: 0OgQbwQw7Sxt5PpUiMsqYz7ScpIscnKA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE2OCBTYWx0ZWRfXxU8HOTSOxCwn
 zw0b+nDQiME4VNOZhGl+InzDVLQI7/f3rrqi1FNWvdVKgS535RnNu0QPu7kOX7wRRvQL1SVSJaq
 baOgaoo/cQwdAHzzg9e0G7fBZQPi+Uo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE2OCBTYWx0ZWRfX/oLw5mFuuq0x
 AwsU21uso+B72a+H6/7B9InP55Erui139VCz35yEysfT/lgR9TJxO8OONx1YMdLvxBFCPkES5+B
 N3gXjqZTEZzj1b6yDp5B3yGwc+rZf3E8Bq0xv3v07z7oFD30f7yD2zq57XEu1TnY53QGI7eT0FZ
 52bIbro7i/2YY8rkXcThRTh/6Q33rDuWSZC7vJnicgolqzhq2uOtl0ZizAnAzpTapm2eIX74N4g
 tDu4E3sJbumw1htbTxZvb13fNcSgoVwMT+rvZJZBHOV8eX7hTiHKPvq4WdoInwOnWLh9y2PMN18
 xCRJCR/+LR0lxlVQR/XT0Tr5xnkFZyw3RU7tCELpVfVw1tlTzGyd7XpIDjR6TK/OJ7/D+FRwd8f
 gXD6xccK3mnHXgtt2uXa1648BshujhWy1p6TE844kzyagPK83LPcvBflBN/YSnP6VwIzj2m9CEO
 S/S+7ay1WQ5ZHzna9nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250168
Cc: Peng Fan <peng.fan@nxp.com>, Yegor Yefremov <yegorslists@googlemail.com>,
 Tuyen Dang <tuyen.dang.xa@renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, u-boot@lists.denx.de,
 Daniel Palmer <daniel@thingy.jp>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Jimmy Ho <jimmy.ho@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 "Lucien.Jheng" <lucienzx159@gmail.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Peter Korsgaard <peter@korsgaard.com>,
 Jerome Forissier <jerome.forissier@arm.com>, Romain
 Gantois <romain.gantois@bootlin.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alice Guo <alice.guo@nxp.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Lukasz Majewski <lukma@denx.de>, Nick
 Hu <nick.hu@sifive.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, Mateus
 Lima Alves <mateuslima.ti@gmail.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, Tien
 Fong Chee <tien.fong.chee@altera.com>,
 "Kory Maincent \(TI.com\)" <kory.maincent@bootlin.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Beiyan Yun <root@infi.wang>, Jonathan Stroud <jonathan.stroud@amd.com>,
 Justin Swartz <justin.swartz@risingedge.co.za>,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Dinesh <dinesh.maniyam@altera.com>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Neha Malcom Francis <n-francis@ti.com>, Angelo
 Dureghello <angelo@kernel-space.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Padmarao Begari <padmarao.begari@amd.com>, Alexey Charkov <alchark@gmail.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] treewide: Kconfig: use bool instead of
	tristate
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
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[n-francis@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:anshuld@ti.com,m:peng.fan@nxp.com,m:yegorslists@googlemail.com,m:tuyen.dang.xa@renesas.com,m:casey.connolly@linaro.org,m:quentin.schulz@cherry.de,m:shawn.lin@rock-chips.com,m:sebastian.reichel@collabora.com,m:u-boot@lists.denx.de,m:daniel@thingy.jp,m:s-vadapalli@ti.com,m:jimmy.ho@sifive.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lucienzx159@gmail.com,m:marex@denx.de,m:trini@konsulko.com,m:peter@korsgaard.com,m:jerome.forissier@arm.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:alice.guo@nxp.com,m:weijie.gao@mediatek.com,m:lukma@denx.de,m:nick.hu@sifive.com,m:jh80.chung@samsung.com,m:igor.belwon@mentallysanemainliners.org,m:pbrobinson@gmail.com,m:bastien.curutchet@bootlin.com,m:mateuslima.ti@gmail.com,m:jamie.gibbons@microchip.com,m:michael@amarulasolutions.com,m:tien.fong.chee@altera.com,m:kory.maincent@bootlin.com,m:mikhail.kshevetskiy@iopsys.eu,m:root@infi.wang,m:jonathan.stroud@amd.com,m:justin.swartz@risingedge.co.za,m:bhupesh.linux@gmail
 .com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:hs@nabladev.com,m:neil.armstrong@linaro.org,m:ycliang@andestech.com,m:ralph.siemsen@linaro.org,m:n-francis@ti.com,m:angelo@kernel-space.org,m:sjg@chromium.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:alchark@gmail.com,m:boon.khai.ng@altera.com,m:patrick.delaunay@foss.st.com,m:yegorslists@gmail.com,m:mateuslimati@gmail.com,m:bhupeshlinux@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:from_mime,ti.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[n-francis@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,googlemail.com,renesas.com,linaro.org,cherry.de,rock-chips.com,collabora.com,lists.denx.de,thingy.jp,ti.com,sifive.com,st-md-mailman.stormreply.com,gmail.com,denx.de,konsulko.com,korsgaard.com,arm.com,bootlin.com,gmx.de,mediatek.com,samsung.com,mentallysanemainliners.org,microchip.com,amarulasolutions.com,altera.com,iopsys.eu,infi.wang,amd.com,risingedge.co.za,nabladev.com,andestech.com,kernel-space.org,chromium.org,foss.st.com];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD8DB6C85D0
X-Spam: Yes

On Thu, 25 Jun 2026 08:47:06 +0530, Anshul Dalal <anshuld@ti.com> wrote:
> treewide: Kconfig: use bool instead of tristate

Reviewed-by: Neha Malcom Francis <n-francis@ti.com>

-- 
Neha Malcom Francis <n-francis@ti.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
