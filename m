Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA81BB51CA1
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Sep 2025 17:57:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98D70C35E2B;
	Wed, 10 Sep 2025 15:57:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C331C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 15:57:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AFeNWh031617;
 Wed, 10 Sep 2025 17:57:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VAM+88EieozUtr7UhaaRCbS18OBTqXF0KuklXk+Y2N8=; b=EtZFhExm3R8XA/lt
 Dq1al8bqy6Mf/AePBleS8UaVA/h6f12gqcS//niWZIex80dp2tRU7cV1U9WaaTur
 rxVNUHucHxHYDVPRQarlEnGFXnl9gcO1vUkEju5PTC18HiOoYT9HnLbdYRzoe49K
 MlpJnfYz2G8cTvclNO75n2pA+3cFEqha24h6ZNCwySHrtg96bnufWRk5m2Eb+wxc
 pKeIEZNIdI27yF89sp7kcEnwD0chmg7bm6g/tHKJ5Kkvc4rY/LQMDPkRzqbmfxp+
 Gbrscuitv26P3qWmoYxbnk+/nIUe3UmSKa5T0J4Oyk/lg4AkI+hDeW/6PxOxkZqQ
 Kc8UeA==
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490a388n4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 17:57:22 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHn9Drfm7nDsQ2pA1gDOHdAziC3GKi8ibrMD126tL37LhnGP/3vU0gmrHK3JuLEkQ35Cs2lOHmWRlu+dfmoCjseWPUOwQIBQEap74NlmRSfCSVgDDGhQD5MGvAfjQfNbz/OFo5NU7oJru/q2IgxNael3BPsjnpquMwVKCPnX4wNXWFVd2VrDyTCaCHoHo4BMMVT3sLZEQ8GWA36oJZt/ZLeEhK6GEK9nI5oIooRjiA9qPweCojnvCH3dJYtvdL4+k4BsEfx0CDE9rZK4xz7ofrRlPN/ZygnjH8/Yt9h6B6V319eroDNHTcNsCbNwCKd1KYcarjgT1/+B8NfV5pnd6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAM+88EieozUtr7UhaaRCbS18OBTqXF0KuklXk+Y2N8=;
 b=fKQbbOIyhIG4zPG/bVTUiPuON+wMz4Zow2Xg4qdZaL6E2WKLk2chruOGdAvmdxTJvF3BCNld9My8IUoHTXtrfA4cxyzmAZSqJFfKvIJKUr1ScnA2BH82T1KUWH9F9+yIuK78bUsrkJTL/LZH4mT6raLtbqdj+Re1pSzmQxfq7E7ziyAFd6p70GdDR66M64Uv/OF5R7DkM3JAXakAi/I3Wd7As00kJeSj5DkTkGQJJ9rIqylVg/1BaSDa5N2ybVOrw1AUHjZ63xxJ6WDwA+f2h2mwFPS7wUtGTI8+N8yStdn1M0pl31mHbFXgHesL8lcVZoH+9ExQojGYi7klKOIkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAM+88EieozUtr7UhaaRCbS18OBTqXF0KuklXk+Y2N8=;
 b=c/t82jxzxus+YKzQwdjaPuFCm2VDN0+hSDkRHleLuP5/mpgbpESCMLfHmXCsAGccHcfXQ8VkcQxpqCaHJSebJ5g40vjAVglNzFwQhQE8QxFUXJonBLRaF8iTe2NZIdIWVddKJfgZbEeFtOTqcnf8ZC18CTLHJ3Dcvj7NaFN+sxA=
Received: from AS4P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::19)
 by AM7PR10MB3157.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:105::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:57:20 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::58) by AS4P192CA0007.outlook.office365.com
 (2603:10a6:20b:5da::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 15:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 15:57:20 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:54:59 +0200
Received: from [10.48.87.108] (10.48.87.108) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:57:18 +0200
Message-ID: <0d0fd822-fbe7-41b9-9c82-e9ffe4b911a2@foss.st.com>
Date: Wed, 10 Sep 2025 17:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <20250808151154.472860-4-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250808151154.472860-4-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|AM7PR10MB3157:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d68318-7413-4582-3fb5-08ddf082b99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjlxaENhSVp5b1lRZWhjeDZBNDBFTTdkdjBQV213eTNiYjNZRUVGT1RIekhJ?=
 =?utf-8?B?bm5mNjNtNVZxSU1LMUl6d20yOUlPK1Q2MFlJTk9nUktJbE9tMkZaL1paZ1FY?=
 =?utf-8?B?NFhqSlNTN2s2MzMvNFF5UUpHd3lwdWFXcEZJb1d0aDJ2L2ZpQ0tNSWsxdWNs?=
 =?utf-8?B?anJiSjlhQWdWZHVSWXdobWI3a2phZFZTa1JrbmlkaXVKZFNuWjlIWGRraTJW?=
 =?utf-8?B?dWtTUUt3WDNhQ1IxSm1MZTlvZXBjRXdVMk5PUlNEWTExaXdGVzFBeUc5TnNT?=
 =?utf-8?B?dTZNaGdUOWh5QlJrN1lsc1N3aVN6ckVsbVBma0JNNjhRMVE5SWNwcVozUTJh?=
 =?utf-8?B?UU9WOUV1dzNWbUtSV1YxaUEyK1pJT1lNbjdDZkdJTEtSUkZLTitDSlU0OVVV?=
 =?utf-8?B?cW05ZkdFUFNRNmhaajltQ0gzU1RVbTlYQzVjM0kzdVZoOUdIRzRlQW9jcFNO?=
 =?utf-8?B?LzNzcjdmZkU1a2oxZmZZUEdoV1lJa0psU29qUkFsMWN5Wkl6dmxTR1oyM3Vv?=
 =?utf-8?B?YWlTUjhXNEg5Vyt0MHVNdmozc0I5OVBmRGJENnBHaXlzRFFrako2L0hBdWhE?=
 =?utf-8?B?ZHhrNHBqUTFoUzg3RnpQWlFwRTJPeDNaVlh3cXJsNEhIVzNlQTZvT2xONTVa?=
 =?utf-8?B?NkJiTlAxSnpUWTM4TTRUM29aQmQ1YjJXSExscThyV1dyNkJZUFRwNGRCUUhr?=
 =?utf-8?B?RGtXYVlQc05zMlhLWU14b05nbjZ5aHVydENUVnJ0MXltamZUSEhzZDVyWWdT?=
 =?utf-8?B?eXlTcklieG1IcUxQRUdzSzUrYUxwS29xNW1qa0Vsd2R2MG4xUGNtTGNWV3d1?=
 =?utf-8?B?UkNBUFUrL0t1cThaUld2V3dyZjdYeHhnOHAxYStnSUVCR3JXT2E0eDd6QVph?=
 =?utf-8?B?M0F2cDBLclFYWVBkVmxuUkV3bGhFZXZ5ckkrbkZ6eXpXNE1pVHVMbXJYdzZh?=
 =?utf-8?B?NXVzcWY2U0VyQW9iWTB1SURzVlRqRlZjMmhvWWVwVE5QdFJsMXJwQ2N2aUEz?=
 =?utf-8?B?T0xOcndLYnZkK29uWkVVQ2tSaHVqMHJ5ZXF5Ynl6N3pGN3paQkloblpCVnly?=
 =?utf-8?B?MWl6UklYTGw5MmVkRFBBOGhONlN6TjJaQjllREV1RUlncytUQlM3cklEMGx6?=
 =?utf-8?B?QnFVLy9kUEFzQ0lmdDdUU1NncWhWTkYyT0pHNmhHak5INnZ2UU12QUtsMkNX?=
 =?utf-8?B?YzVuYXdydVRaZUpaa1hQWjVWOTdKQzNLdXg0Ui9iRmllOE0zY21YamRQby9m?=
 =?utf-8?B?aWEvMHlFdG5JZDRwaUMvOSsvZFlaYldibnJIQStsUW1lc1BxVC9UYklIM21i?=
 =?utf-8?B?S0NIbE1wcEgrSjZMRWczOHc2NmFOU3NHK0Fvb1NnTVNBNllMWUdFSkJ2aUFx?=
 =?utf-8?B?VXljVkFCVXh6RFRSaHJ2MExzU1l6eUZwMEdNMHdwVjNPYWhKak5pamRCbEpr?=
 =?utf-8?B?UlFoSEZ5NHZkclo1ekM0NDJ4bExJZHBjcUdzYXlibGFKRlRSZ0V3MlNoZXNF?=
 =?utf-8?B?bWhpcnU2ZXZiQm52WVRzN3ZNY3VKT1JUZTBnNitmQWZ4aUk2cFh6dGNjcDho?=
 =?utf-8?B?ZTkrUzVwOHlHeUdMd01xclVJNVc1ZkZDMGsxMVdqdUJ4d09PaU9KVytPbm11?=
 =?utf-8?B?WEVGVXkrWnozT2ZFb0FtTmphSDkzbFpZUFQ4RThnWlI0Z1NOcTlob0dxazVD?=
 =?utf-8?B?Z1NtYUNmd1hSaHdvQXRTQlFWTlpzNXVHL1JpdnRqKzBNT3A3K1dOeVNTRTZQ?=
 =?utf-8?B?dXJ2ZXNtNzJkbjZ6a1dTVGtCV0NjaytHY3hKNFJHdktHaDJOTXluV3dRMWpq?=
 =?utf-8?B?MGR0OXdtdUcwdEUwMVRqVG1BbU1DODMwTGMrSFFPTnlGcU1YYjl4THlBRzZL?=
 =?utf-8?B?QmtlNEZtdHl6cnlHbXkvSm1rMytwN0crZkMzRXQ2NDdYVHZWWTVUV3MzUU40?=
 =?utf-8?B?Yk04c3hkR24yK1VocnZUOW8yTmdWdlpOSUplWXBrZnN0Y2k3dldZTCtqWUo4?=
 =?utf-8?B?OVQ5eG5uL2VRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:57:20.6198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d68318-7413-4582-3fb5-08ddf082b99f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3157
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDIzNyBTYWx0ZWRfX1dKRNWBBwfzn
 YPUydkpeaghbc5f/sbzqly2WMf3pPNEIsuIx1nZLF8mGz4qHkIRhdv+C92Ha8CS4Pr7DZ1RnSny
 sJyBGQ6X3Haxy6HnOQL2pFRBnmYgEjDtPAb1HBa6hFX+JJczrIIlZRjT2GnKdL5SCJC0hYsfXV/
 3RDOd+nhoZS+YdP7jG0f8S3Mk/mGnAwTjdORfznAZkCzIf5eMJd8wPWLyDGHhDsoaZx8hujV/Sr
 a2WUU1x6eYTerhnTQJ64aEnLq/W0NSGrDX4LxUVFDuF1hUw7GH3MHKs2XrX23OiCSHJXMYK/IwM
 kOJyejTuxFbg9oBMImHleEmU/gn51Lj+cpRnvpwyWvyyr2BnEY4vXB3hlFvmFdLV6mnjhG9NNP2
 pKAQ4qYF
X-Proofpoint-GUID: hKKV4lz9V-mQHsZtUkyr88wws_Q834VN
X-Proofpoint-ORIG-GUID: hKKV4lz9V-mQHsZtUkyr88wws_Q834VN
X-Authority-Analysis: v=2.4 cv=WLB/XmsR c=1 sm=1 tr=0 ts=68c19fe2 cx=c_pps
 a=cJFLXlvTZex2m2t0Pupgcg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=YfCOm-DyAAAA:8
 a=8b9GpE9nAAAA:8 a=phlkwaE_AAAA:8 a=6U3jFd9iSUG5R7_1p5UA:9 a=QEXdDO2ut3YA:10
 a=zQLMK8awuJ6_Hvp-_9Ux:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=uKTQOUHymn4LaG7oTSIC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1011 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509050237
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Alexander Dahl <ada@thorsis.com>, Simon Glass <sjg@chromium.org>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, John Watts <contact@jookia.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Christian Marangi <ansuelsmth@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Uboot-stm32] [PATCH 3/5] spi: Add STM32MP2 Octo-SPI driver
	support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 8/8/25 17:11, Patrice Chotard wrote:
> Add STM32 OSPI driver, it supports :
>    - support sNOR / sNAND devices.
>    - Two functional modes: indirect (read/write) and memory-mapped (read).
>    - Single-, dual-, quad-, and octal-SPI communication.
>    - Single data rate (SDR).
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/spi/Kconfig      |   8 +
>   drivers/spi/Makefile     |   1 +
>   drivers/spi/stm32_ospi.c | 623 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 632 insertions(+)
>   create mode 100644 drivers/spi/stm32_ospi.c
>
Perhaps need to add the OSPI driver in /MAINTAINERS file for stm32mp 
driver ? as already doen for spi and qsi drivers....

ARM STM STM32MP
M:Patrick Delaunay <patrick.delaunay@foss.st.com>
M:Patrice Chotard <patrice.chotard@foss.st.com>
L:uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
T:git https://source.denx.de/u-boot/custodians/u-boot-stm.git
S:Maintained
...
F:drivers/spi/stm32_qspi.c
F:drivers/spi/stm32_spi.c
...


and I miss this remark for previous patch whih add the driver OMM in 
memory directory....


Anyway for the driver himself


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
