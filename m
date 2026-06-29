Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zqdaDBjzQWrtwgkAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Jun 2026 06:22:48 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C516D5D22
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Jun 2026 06:22:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=ti.com header.s=proofpoint-05-2026 header.b=jhFcKnbP;
	dkim=fail ("body hash did not verify") header.d=ti.com header.s=selector1 header.b=Ol8z8b6e;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ti.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDE2CC56600;
	Mon, 29 Jun 2026 04:15:25 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com
 [148.163.154.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA925C14548
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 04:15:23 +0000 (UTC)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65T2d9hl892291; Sun, 28 Jun 2026 23:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 proofpoint-05-2026; bh=/UopRVJrv6qndBmaXE2sWNRMb+TzpDTkzh0g5/ZF4
 Zc=; b=jhFcKnbPzUNM5bSuSng6LCM1lTne7oTrZwoE+AM7wd62o/NMw+SagPBjR
 WRqYuityLxacaQWhXcFlu+NVUtiiVANe1uj4k9Z0ItR9cdaIj68PdrkQ5qeMcRiG
 DmZ8Uda1TM1wQ8JThhRHxg4E597JoH+fO9ODZhEwk0WsAJPrdBxGwwkhb/6bOcL1
 mpyZVU77Q9dlWWyOSd3hCnP4glzMM66iSCKYw/Pz5ZsUk5Bf4graHdq3TDGCVQpb
 QHxMInFsDnCFwedfHdWoJLnJWwTt3PGCLsV8zWfUkrq2/L1DLCSjTwdk9qzpN4VH
 FFntRJRk84gDSJ/deiPetKxfqV2MQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f2wnpctsp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 28 Jun 2026 23:13:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svGZt15NudmqMxGNuL/obCQCqB+yfieH8Q8H2EaAh1E+OIZwux6M4dtwxtx08C41QEV3jY3zusUPAOiwt5L2KDMMBr27EmWKV+TpXzgHOXs1nXDOlWBNliCDD/3TS+AjM5VOPbgSueU1X4PvaYnOzv5QuG7nz8QHMd55kWKt5YItR30V2JSM9m4yoyLyt/aEXkYNk0w+3DT//M6sGro2/fUzKXSUk8cffwsJa0eCt3zNulFeducUq6HRJkPl2Hgs/ZasxcdKrvLGyI25c0d51d8aWaULDN+HrMmPt76yjOikx3Vp5dFlAnbnIfUY9YPp0rDyVmRdvr6zAeFDJPJJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UopRVJrv6qndBmaXE2sWNRMb+TzpDTkzh0g5/ZF4Zc=;
 b=zTuEBGMzvaxZ0NPZz3TncXjqzE2+RstJzNjZEq//59xQ9hFlwDGaCxIsoQhZyx/LSYjd7yVtVRik/XaDXs9ST/xRFSICwYGxypp63ncpYMafgi5twMkQsBwa8Ts9LrIDyKbg8aD2fVAlCi5gFZWKYPLjMWjS5v/gMSm6XbYSExirLCtXaJlh+YeirJ+V/bmmWDVzBsHpWR0TmJXTnHRf9hU5z4E68h0LqxF/i+cMRnrZe7ASlb93eEhvyG1cKD5ginOmM2zWDr7fVpcB8An2wk2KrgK7ieYl4lp6qzpdXYi9YQsQJp5bsmLlf4jsPpclWG66g2jIztUtnvEH97y3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=googlemail.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UopRVJrv6qndBmaXE2sWNRMb+TzpDTkzh0g5/ZF4Zc=;
 b=Ol8z8b6eulHCICufP5mCUNROj1nYx58+3H0FbY1/3qBqw0IDPamXAQaUrgnK/ME117oDnI7fr/N82CeZBGPwG70spoaOskOZ+4xf243kgHn5uBieuGTr2GqXS3dn9jM1K4Jzn2WrggIgWtPsPqQCBsS4ZpAXgq0mg+KaFJTICks=
Received: from SJ0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:a03:2c2::12)
 by IA3PR10MB8514.namprd10.prod.outlook.com (2603:10b6:208:571::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 04:13:43 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::9) by SJ0PR13CA0037.outlook.office365.com
 (2603:10b6:a03:2c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 04:13:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 04:13:42 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 28 Jun
 2026 23:13:42 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sun, 28 Jun
 2026 23:13:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sun, 28 Jun 2026 23:13:41 -0500
Received: from localhost (ada0543016.dhcp.ti.com [10.24.50.146])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T4De0Y3166731;
 Sun, 28 Jun 2026 23:13:41 -0500
MIME-Version: 1.0
Date: Mon, 29 Jun 2026 09:43:40 +0530
Message-ID: <DJL8ONJL18S7.3MUBPJW6U56QR@ti.com>
To: Simon Glass <sjg@chromium.org>, Anshul Dalal <anshuld@ti.com>
From: Anshul Dalal <anshuld@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260625-tristate_fix-v1-1-95e16153d752@ti.com>
 <CAFLszTiMJDrOhGcJtsr6JKQYu8NZTRWZF+3aQ0yO0CGMVZAfEA@mail.gmail.com>
In-Reply-To: <CAFLszTiMJDrOhGcJtsr6JKQYu8NZTRWZF+3aQ0yO0CGMVZAfEA@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|IA3PR10MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab316a9-15a2-4d20-01cf-08ded594ce58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|4143699003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: Mo0NzAR2b2trzctDbA3b/3QGJaSdbNm00POO6UtwtiSwZqSnAlVlFgg+ZMogOq7f/Qf2N1EeaSfUUNoP8iG6HEpyBwvNDZa6/fw9SGFuE9McY/TzUW05vACVzW3QgUd1DnEazKlNYUtxPIOum3Gl677AMuUN7nW2bP2iX1Fox1acuoZ/xWclSORdYQv0ATl/Ax8jOlPSaC5U81EYGw3WoIIbJq+ifFYTIVK0XoIwy523cx1bqU2Je7S6hacY5WHSS2NZiOAvMm5qr8RTt8/N3JZ09QszaqA2ov5DtM1W+sN485m6OhycvK54hkCy9DusswN655F3rBawXVLQH/TNp2Gojr2LirYeQNZ6SE8z55NnpVwN7jMdEFfREeZvUJ98LdJN+467XfwkgdMUaFM3NQkGWGeIzN2OOf4ozSMmDJPHhm7TyXKwlzsnr0++77DPWP0ze5+Z39tlhk/GJ3Kv2igdF1v2M4Fc8JdnGhe8JLzMUjEPy5ncbLgVh/XU1z/+KXnL2QaMR3XYh7siqdwNjoxLSGOGjwiFTnBgU8jaD3GHX118TiJEaRBzsxUFU5t5l31VCt4/apzCJURDImIHQEwLwaG+8ED+rYa63tjizGdC4A/sUr5OWtQr5mbjV+cIlM821fUOWkMgV/m8WaMemLyJWsfpHPRdAK4FtZIE9lU5Uh8elQia690uJii4aUBzciT5WCdqxTb+R+pTVwnCfA==
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(4143699003)(56012099006)(18002099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w0zReQ+VOX+Zp59qcTrsjakR9ustU/5AH2tl0R6mYbxMv4zPEQtuXqBzSr3eT4LhuZtsOAV+NtyVJf9ZxqnnbbJygEJ5LjnmMUc13/36PezhgsxTcRl7EFI8jpbxK44mxtSRMv8oUAhmUFqn2YGDnzW/l3dZN1WTfFliANrBMPQ8MOaEwmIneUtu6X0OsA4kSutntFaAMdN5R50zae/IbEABIjWk7xEPPCb4afoH7CSdmHY0dswGD9/5NmyZ/QLmMuzHqwY8CDThFXpOceh4e8GgQVkilPdprSGEEXsMkFJyxGjNWY2cTQZ8Bg8h+BuQ7szd3d7dB5/xOQEPoSzZZE1yrN595CoUq6CTIphK+FoeRb1gbNsApTBamv4VbmnkF9Wqe+YY/mzfBdD1I8Qn7n/qWb1JuogHUfAZmxBEANfRbKg/4q08j/5aIP/DMMWg
X-Exchange-RoutingPolicyChecked: BUGCtmsjgoaeSRDqy3RMHPwg6LIbA/wsZAVDuEMUPqmnHHjMHRsa6I8ONW0rqoY/oEyN4I8XjHuDtDilfT20R2JrByg2xaq3+0+4Ho1umjJ0fx+5rYS+aSnnjNcTRofT4frRPdwurNyDNjfHdBUSb1qLXRnqYswXggMrWtG1lLdMHbQnNdVO/KzasGY0CuvH3LW4IPi2Q/I3gRXPrBXoYzU8Bb0NuWdBvjaz8H/JmFY82lq1FM7dzrMbZut8ROtJ9IE5Q1XFaZLeDrpyxzMFihQm+PQ2JPRCjUf4Y6uLjJBmVt26Ciip/2MyVa1uyun+zopCJqMeCEkX3bAoWBumFA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 04:13:42.5998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab316a9-15a2-4d20-01cf-08ded594ce58
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8514
X-Authority-Analysis: v=2.4 cv=QdxWeMbv c=1 sm=1 tr=0 ts=6a41f0fb cx=c_pps
 a=dAhe3p+MvHJ8ujFi5nYcpA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=NEAV23lmAAAA:8
 a=voM4FWlXAAAA:8 a=sozttTNsAAAA:8 a=naIhm6FsqYv1srbW5wEA:9 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: uuJmapIpu9xRxTFqdEy-2C1610VuzrCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzMiBTYWx0ZWRfX9IeemKivRWLK
 av1wE3VgIL8UFMBMx5WwhYII2M9rDJjhYyIQzc777MkYubsS89NHJDirvaicaSpTqvUUddFiUEH
 DR/6ZIgqS8b9O1J0YyLQMZUJAM+SMPtnqa3RtmdYcfXQQMwJNCPgohxPgfiDKZ/sexPb8jC/kDm
 fqjOjivXtNQaeg2/9Hq/6s7XZ/Eprode18aLyFN9u1kZ1i/8eg/UBl25qY4OsjmZ8nubPpWA3fy
 c8KF9KUz3wrrVbBqeYW7jlc01PokiuQ7n2UcisaLrHF686ccZvo/w+FWBTyjsKLSIJ6cV58VKYy
 Y2QrR2gHvYC7wYQ+stqbg2lDQiiEdIcFlrC3WuElXc8zSGaY9GjikI9RzstAoIq09xGu7e19hpr
 xK0k2j3yFcqH99KODv6tQpJY09r0IYt09GuytUsSCihwZ5MsjiBo5yR27IuaEjYqm0/PQX9f2Qx
 kLutAY/Sj1DcE8xSQrg==
X-Proofpoint-GUID: uuJmapIpu9xRxTFqdEy-2C1610VuzrCP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzMiBTYWx0ZWRfXxQZdw2n2Ms8i
 9xn8/XHA9T2HKU8dj45khkL+tvK3FTJWRKL81l+Nou9WTk1w/9UXD5SuyV3rjJyBQ/1/Yst5h21
 9PHFwVQetuwUDA01NPvBhdhIpT76tT8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290032
Cc: Peng Fan <peng.fan@nxp.com>, Yegor Yefremov <yegorslists@googlemail.com>,
 Tuyen Dang <tuyen.dang.xa@renesas.com>, Casey
 Connolly <casey.connolly@linaro.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Shawn Lin <shawn.lin@rock-chips.com>, Sebastian
 Reichel <sebastian.reichel@collabora.com>, u-boot@lists.denx.de,
 Daniel Palmer <daniel@thingy.jp>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Jimmy Ho <jimmy.ho@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 "Lucien.Jheng" <lucienzx159@gmail.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Peter Korsgaard <peter@korsgaard.com>, Jerome
 Forissier <jerome.forissier@arm.com>, Romain
 Gantois <romain.gantois@bootlin.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alice Guo <alice.guo@nxp.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Lukasz Majewski <lukma@denx.de>, Nick Hu <nick.hu@sifive.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Peter Robinson <pbrobinson@gmail.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Mateus Lima Alves <mateuslima.ti@gmail.com>,
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
 Ralph Siemsen <ralph.siemsen@linaro.org>, Neha
 Malcom Francis <n-francis@ti.com>, Angelo Dureghello <angelo@kernel-space.org>,
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:sjg@chromium.org,m:anshuld@ti.com,m:peng.fan@nxp.com,m:yegorslists@googlemail.com,m:tuyen.dang.xa@renesas.com,m:casey.connolly@linaro.org,m:quentin.schulz@cherry.de,m:shawn.lin@rock-chips.com,m:sebastian.reichel@collabora.com,m:u-boot@lists.denx.de,m:daniel@thingy.jp,m:s-vadapalli@ti.com,m:jimmy.ho@sifive.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lucienzx159@gmail.com,m:marex@denx.de,m:trini@konsulko.com,m:peter@korsgaard.com,m:jerome.forissier@arm.com,m:romain.gantois@bootlin.com,m:xypron.glpk@gmx.de,m:alice.guo@nxp.com,m:weijie.gao@mediatek.com,m:lukma@denx.de,m:nick.hu@sifive.com,m:jh80.chung@samsung.com,m:igor.belwon@mentallysanemainliners.org,m:pbrobinson@gmail.com,m:bastien.curutchet@bootlin.com,m:mateuslima.ti@gmail.com,m:jamie.gibbons@microchip.com,m:michael@amarulasolutions.com,m:tien.fong.chee@altera.com,m:kory.maincent@bootlin.com,m:mikhail.kshevetskiy@iopsys.eu,m:root@infi.wang,m:jonathan.stroud@amd.com,m:justin.swartz@risingedge.co.za,m:
 bhupesh.linux@gmail.com,m:michal.simek@amd.com,m:andrew.goodbody@linaro.org,m:dinesh.maniyam@altera.com,m:hs@nabladev.com,m:neil.armstrong@linaro.org,m:ycliang@andestech.com,m:ralph.siemsen@linaro.org,m:n-francis@ti.com,m:angelo@kernel-space.org,m:ilias.apalodimas@linaro.org,m:padmarao.begari@amd.com,m:alchark@gmail.com,m:boon.khai.ng@altera.com,m:patrick.delaunay@foss.st.com,m:yegorslists@gmail.com,m:mateuslimati@gmail.com,m:bhupeshlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[anshuld@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,body];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,googlemail.com,renesas.com,linaro.org,cherry.de,rock-chips.com,collabora.com,lists.denx.de,thingy.jp,ti.com,sifive.com,st-md-mailman.stormreply.com,gmail.com,denx.de,konsulko.com,korsgaard.com,arm.com,bootlin.com,gmx.de,mediatek.com,samsung.com,mentallysanemainliners.org,microchip.com,amarulasolutions.com,altera.com,iopsys.eu,infi.wang,amd.com,risingedge.co.za,nabladev.com,andestech.com,kernel-space.org,foss.st.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:mid,ti.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,ozlabs.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anshuld@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[ti.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4C516D5D22

On Thu Jun 25, 2026 at 7:12 PM IST, Simon Glass wrote:
> Hi Anshul,
>
> On Thu, 25 Jun 2026 at 04:18, Anshul Dalal <anshuld@ti.com> wrote:
>>
>> U-Boot does not support modules, so having tristate options is useless.
>>
>> Therefore this patch does a blind replace of all tristate options to
>> bool tree-wide.
>>
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
>> CI: https://github.com/u-boot/u-boot/pull/998
>> ---
>>  board/st/common/Kconfig      | 2 +-
>>  cmd/Kconfig                  | 4 ++--
>>  drivers/cache/Kconfig        | 2 +-
>>  drivers/clk/Kconfig          | 2 +-
>>  drivers/firmware/Kconfig     | 2 +-
>>  drivers/i2c/Kconfig          | 6 +++---
>>  drivers/i2c/muxes/Kconfig    | 6 +++---
>>  drivers/i3c/Kconfig          | 2 +-
>>  drivers/i3c/master/Kconfig   | 2 +-
>>  drivers/memory/Kconfig       | 2 +-
>>  drivers/misc/Kconfig         | 2 +-
>>  drivers/mmc/Kconfig          | 4 ++--
>>  drivers/mtd/nand/Kconfig     | 2 +-
>>  drivers/net/phy/Kconfig      | 4 ++--
>>  drivers/spi/Kconfig          | 2 +-
>>  drivers/ufs/Kconfig          | 2 +-
>>  drivers/usb/cdns3/Kconfig    | 6 +++---
>>  drivers/usb/musb-new/Kconfig | 2 +-
>>  drivers/usb/tcpm/Kconfig     | 4 ++--
>>  19 files changed, 29 insertions(+), 29 deletions(-)
>
> I don't see this in patchwork but it looks like you sent it correctly.

I seems to be up now:
https://patchwork.ozlabs.org/project/uboot/patch/20260625-tristate_fix-v1-1-95e16153d752@ti.com/

Regards,
Anshul

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
