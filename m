Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F5B85870
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Sep 2025 17:20:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B767C349C6;
	Thu, 18 Sep 2025 15:20:47 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2C11C36B13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 15:20:45 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IE8Fnl027242;
 Thu, 18 Sep 2025 17:18:49 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013014.outbound.protection.outlook.com
 [52.101.83.14])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxhsbms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Sep 2025 17:18:49 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR4ksmpQpSidFkXX4FezY4Dxfdu6rIefbz1+rFWcZCYCeuEI9lPGhnmk2ldDtv4te6qSjLMqYfM7CHtpToeyMun93WV9xLun5CsacBeogblwMPIw8DkUYyhF7Ubd2i7G1TQpV24mistz/7sYIQPNT1rfs2DfhGo2rvHGIMXgRz7Wp3FvcGcYqJGr/K93+eXn4fyAq59yzXL+GKZB66CDzjgMl+hkqlayuSE431yf1m8GgKhQwA3vUXnTMjKwSOf/372d9KWPcHBNjo0KIypySvY9yxLXdhp12GBrvYHWOsFgBXCZ4XHdntYM118Os+iJTj0+RAhD4kP1YfRTYTBsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sLvIZqM7UEczEDKvSC6kbpJ/ULxz8l4eX9tTCOPMxE=;
 b=JWrtMqCQpON2e6nqY/PAQ7JN5yv7TpZvX/6pdVthX2YQKKe2TQfES9z6bKkj4dJYhCPUy8tH6Sh/g+AEzsV8mLScFs3D0lXszeumssa9T3PGwNKyNfpS+J0Gh5vnEZLhtdi/1SNP2At8N7R5/t5c2RnAVyirqfvi/E59co5kD5SWvVBATDGwWu8w4JaNm1MAnlKJdBwuI9ZCf06ZPSxY+Mt4sVVCiP6IgPT8wluALe+yiNfO8u8T4d28motPgQZkqmjJNRi+rQVe8yWusowXRgFHGXDSNQJfYBd2Njo9SS+tcCSzZpCMS3fuMVyqIHDgiMXdng6G7rWsR87ORuHTBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sLvIZqM7UEczEDKvSC6kbpJ/ULxz8l4eX9tTCOPMxE=;
 b=hQOd1ofdh3SfOwGWdhPYuC2AZ1hogSZmt/hvF3Tea8yeq7XrmplErcEyoEpV2AOWXVD8PDHhzuQ2PsSZVG4E1gon1iSoOveHWPifUtxOSlskW1natQCpu772a+Jc3xy5c8YMQ5KMC8bQlingxfOugwwAc+WWhbQ/3+Zy3iVYdWz/kBgBmgBYRT1YemVyjzCyUFgVgIY9RFrMTZBeWz6o60p79h80A0KJL/oweOJ6UgC4zU4d0f+WXWyJ/YyqncdG9SuuNRdXkH6pxaOEGJu/VAuA/CuwXODUU9qDH8RJCgiuq1DDzJ1m2WCcrA/mOJFeqh+eFO9r+pnS4WEJl4erOQ==
Received: from AM0PR01CA0142.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::47) by VI0PR10MB9171.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:234::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 15:18:44 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:208:168:cafe::7c) by AM0PR01CA0142.outlook.office365.com
 (2603:10a6:208:168::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Thu,
 18 Sep 2025 15:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 15:18:44 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 17:11:41 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 17:18:42 +0200
Message-ID: <ab67572f-887f-4a9e-a293-3e01d7526112@foss.st.com>
Date: Thu, 18 Sep 2025 17:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250911065944.15020-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250911065944.15020-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|VI0PR10MB9171:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8475b1-a1ab-44ee-17b8-08ddf6c6a838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDRFRXIxSmJQNlFRbmh3aW1BYzQvWkhCdVNJd0ZHdXVkQjNZUVVmZms2R1k1?=
 =?utf-8?B?QXpSNGJkRnNVa1VTRXBCdmFwb2lnY1NlL1RJSVN5NG9SSjlrSjNpMjBYMzF2?=
 =?utf-8?B?dHBMVFExNnhudkRMUkJmeG5LR1UvYlhobU9wWEJNREU4dklUTFJaZXUxbGJa?=
 =?utf-8?B?aWo0ME56WWg4dk9Pb3I4WWRsQUpja2dTUUZXRldaUEppSkNsZXJ4RUViVFkx?=
 =?utf-8?B?NkxJdEtkSmtrOE50U2J0YnVKR2NkZnU3SGszd3gxbGtEemhWcVIxOTJOazVV?=
 =?utf-8?B?SDJGZGdwbUdzRlVUc0xDdVB4eXduVHJQUWRiZ2p0a3RiSEtzUUFmZFBTYzhi?=
 =?utf-8?B?WHBsdFNERGloYzU3WG1zWnhDaHAvWm1laVpkcTcvZHcxYlBDWi8rWCtZNnIz?=
 =?utf-8?B?RVJUUWdCZWhUUHhyUGUzaUxUQ2xabGxGeEpVbndYU3JTNkhPT1ltLzVSZ0h5?=
 =?utf-8?B?L3hSbmdLNWJodWdRMWFVbW9BY3AzMCtVU2dTVXlSd0xDL1dlZlpxU2U3bThs?=
 =?utf-8?B?WDloL3hWQnp2OENDbXc3OTFnaXdCUk11RExDMW56Um5ISTlrMmJDazJmNmsx?=
 =?utf-8?B?eWUyVGZmRmp4WVBtcnUzd0ptU2VQN0JHU0xlRXhDMmxSaktnUm1jUlhOL3gz?=
 =?utf-8?B?UlROT2doMnpYN1k1YnRxbFlsRy94ODJYZ1FBQVdhdVpOak1YalhmTEpMUkZ4?=
 =?utf-8?B?a1hWaWlCa0ZIbW5GLzFWR2JsVGJ3MURLd2IwenNMbkYxYzA3OGNPRFZqalpU?=
 =?utf-8?B?NWtYQzNZOXQ5ekowSG5ZWmlYSVEwNlROS0V2eDd5L0tiZnQ1cnBFc1FyMUFN?=
 =?utf-8?B?cmNIckdQWnNpMWxieVRMQWdrNGZQdjREdlZzOWgwOStOclBwQ3c5VGlKUTh0?=
 =?utf-8?B?TlprZWpHR0VobFVtK0xxR04zYXVtKzlXRjdWTTZWcWpEdWpSclAvQVJnYzcv?=
 =?utf-8?B?dlFnbWVaMUZhMGV5cm84elR2eGhZa1Byb0dQU0VqSWtOTDJRM2lyTFNTQm9B?=
 =?utf-8?B?R3hlV1ZwOWdIakEyRVpUSnFHRSsyR0RaVGJ5UEhVc2JNUDVzdlNsWXpnWlFH?=
 =?utf-8?B?Y2RFN0RJM3dYenhnaDg5ZFVnQklOQUdRaTlFazAxSjgrU0laSjlMVUFURE4w?=
 =?utf-8?B?S0VJMUE1ZUw2OWdpekZGbnZoN3h0ei9xeTd1aWw5ZzZoSmQ1TWlnWmdwamlm?=
 =?utf-8?B?aCtPMFRvbEdoMXBmY1JYRmJtRXN1ak1HWVZ4a1FUM1F1WUtDUlRUb3psVUlQ?=
 =?utf-8?B?Z1JQa21SaEZVaGRVaFRzRWFTOEZvMGh2bytGRjRKSkpOc0RyV2Zic2VLUVNR?=
 =?utf-8?B?b1YxYVlCWHQydlNMTU1GeDB5NHJ0RHlXd1pWejFRaG94Ky9QQmYwdERpUHhZ?=
 =?utf-8?B?UmVVRWhNcytyU1BuZ21MMFgwRE9KZ2NjYlhrandGbnl2MGRKaGJXSmVmNHQz?=
 =?utf-8?B?VmR4RzROaldUNFBJRmtYZmtoai9JbXFINUxEeVE0YXhtcmRVdlhUQS83TWF0?=
 =?utf-8?B?MmphTjF5LzBJS1pncVZSaXBGZ3JkSnI3TzdzQVRvNWt5U1J1cmVFQ1ZlYm41?=
 =?utf-8?B?Ui9HWGd1cHBzaVk1bGlBckVZZkRpZEhlc1dQRnJPWjhVSzlQL3JPUnBvVjUr?=
 =?utf-8?B?RDFPRHk1RkEvUlZxV3RYMVcvT2I0YmRlYXZDZGg2dHlYM1RzL3M1OFExTytR?=
 =?utf-8?B?ZGZ0QXVkWFVNSElQb0VRWURPNjFmSmQ0WmNUczhRL3BYUzJRK2JiamFQaUxi?=
 =?utf-8?B?Q2NoQ0FqZno4UStPbHZBU0V2OHZseUNNT2hWaDY5Y0FoeGxsTXBIczBWcVZJ?=
 =?utf-8?B?QkxvWFpneTVsdWZROHdqamRwc1VWMG9zN0VZcE8yL3RoMisrckFrUW40WUpt?=
 =?utf-8?B?dkdqRE9vNVRhM0ZYQzlQTXMrZjNjajd0Z2IzVzN2MGNUR3dScXVKSmZKNHVX?=
 =?utf-8?B?K3JuUzNteFY4UDhGakx6dm5aME82dVRQVVhtcGQ5ZU54emNndE80QkNVNyt3?=
 =?utf-8?B?aUhGbWtldkd0Z1M5RUZZU2Jwa1d2Vzl0M0NRWFQ5R1Zoc2Ezb01hbzNOUEdP?=
 =?utf-8?Q?XcfWU4?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 15:18:44.1782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8475b1-a1ab-44ee-17b8-08ddf6c6a838
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9171
X-Authority-Analysis: v=2.4 cv=K9MiHzWI c=1 sm=1 tr=0 ts=68cc22d9 cx=c_pps
 a=g9/3GMKIs+LCGVgKrk4MiA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=ffTtklqvlGEvEUKueFUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7x+zZuIk/RGG
 EprPsWPRPS0oPOEl2p2ETxgMsbTJsHs+Qfxif7wc/icRtDW7dprh84yfof9OXb3lkVPCuFp0yk7
 OsvD/wS1jLAbSNjhmIpRk8adqq+RWVMvVr5LZbpEWJNp9PMh0Ho1GDPKrFz9+RlBOg08S8YQG83
 U5OwzocjlY90QwufUQKmhXzADxHqcfi//HM5Z2RRNIs21r9PT4nB1a0ImMzIljTzU6HVRI47ZQI
 iTh6IKuNlMrOzf96x+1nBs+qxerv+5AqZmgDSyprR9s0EfBAhEd/eKweS821/FOaRTrNLhWSMVs
 WTOW/4e8vf8aMUE4Qqu9tKf+QLOmKHuHmNLxwC+jzYdPFwLjNEktHAdndWAvjEZnx7VC865svuy
 w+yLXEBq
X-Proofpoint-ORIG-GUID: 1jJx92I6Nh_RHVbAhkp2XjlS6sCkPcut
X-Proofpoint-GUID: 1jJx92I6Nh_RHVbAhkp2XjlS6sCkPcut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Cc: Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, Stefan
 Roese <stefan.roese@mailbox.org>, John Watts <contact@jookia.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Tom
 Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Yao Zi <ziyao@disroot.org>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Sumit Garg <sumit.garg@kernel.org>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Utsav Agarwal <utsav.agarwal@analog.com>, Heiko Schocher <hs@nabladev.com>,
 Greg Malysa <malysagreg@gmail.com>, Alexander Dahl <ada@thorsis.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Cheick Traore <cheick.traore@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/5] stm32mp2: Add SPI flashes support
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



On 9/11/25 08:59, Patrice Chotard wrote:
> This series introduces 2 new drivers:
>   _ STM32 Octo Memory Manager driver
>   _ STM32 OSPI driver
> 
> It adds resource check helpers which are used by OMM driver.
> It adds and enables OMM and OSPI driver support for stm32mp257f-ev1 board
> 
> 
> Changes in v2:
>   - Add stm32-omm.c in MAINTAINERS file
>   - Add stm32_ospi.c in MAINTAINERS file
>   - Collected reviewed-by from Patrick
> 
> Patrice Chotard (5):
>   ioport: Add resource check helpers
>   memory: Add STM32 Octo Memory Manager driver
>   spi: Add STM32MP2 Octo-SPI driver support
>   configs: stm32mp25: Enable configs flags related to SPI flashes.
>   ARM: dts: Add flash0 partitions for stm32mp257f-ev1-u-boot
> 
>  MAINTAINERS                              |   2 +
>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi |  41 ++
>  configs/stm32mp25_defconfig              |  15 +-
>  drivers/memory/Kconfig                   |  17 +
>  drivers/memory/Makefile                  |   1 +
>  drivers/memory/stm32_omm.c               | 421 +++++++++++++++
>  drivers/spi/Kconfig                      |   8 +
>  drivers/spi/Makefile                     |   1 +
>  drivers/spi/stm32_ospi.c                 | 623 +++++++++++++++++++++++
>  include/linux/ioport.h                   |  16 +
>  10 files changed, 1144 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/memory/stm32_omm.c
>  create mode 100644 drivers/spi/stm32_ospi.c
> 

Whole series applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
