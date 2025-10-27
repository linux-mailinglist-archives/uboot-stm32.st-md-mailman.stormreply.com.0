Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B55C0F5CC
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Oct 2025 17:38:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AF3CC60492;
	Mon, 27 Oct 2025 16:38:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0912C6048D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 16:38:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RGN5Uv2184917; Mon, 27 Oct 2025 17:37:51 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a260b1pd7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 17:37:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6e4RjQ3MK7+IzgU07DTbxAj9E8PBmHG5DrFtRuMC/o2xxoeSTmCn4NfmaVm00/bnxHN+elt/spuYb91qZS7i4bPkxpNNYct+8DCy24C17k9KUyxUBZupfXEMPL9Nuzbwt/TmcJfsLUBLGfCKbIQ9D74uFwcFJPqmnPJ5/lb4kDx8gpM+mmh6h06Np6XS1h1QFDOY7/vcWhmuGTPZd8SmKOlCpYUfh/3oE31c28NqcbDYkKFl5fF76D+Mr16KoRPUWON+ziDve8+XxtzUODWi6OCJdx22jxJhwKaCxJV2xQZZ/Y6T9FThuURpMV0CjXf0pKphTwrNKzB9klWdpbM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tc6J4TxnPoK6ujeru6Iuzk2COZ6FoZCIZUD5kc0sshw=;
 b=bB74LcHA2wzgXkomDCFYkSJCDtRCvYiWBBg38Fe5pRYEwtn/Xek+BDEjI+KhwoPQY9ryt1DHWDqXioFPzEFdbNvOgim+gJC6uttuxagIGKeqWkJLw40husfL0TqQWiaEM73n3lpLMqOEL/ZcJWfSvWlWhqFJ3sEk9kIKbwwZccH0Uf7gHT6iwRAKVAhDpqap1rqcNzcxpruD/uOGnGYBakX5DFPX2uULHcqZYQU4bgqk/sgbihZlGck7nqimKtOo/WuOwKOo5s3BMgO6HMp8V91cOBlRLrle6xetnSBAHvKZMNWR2HsQPxKLnjqMfMzlebqBBhaYzTXX2qIr15Sv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tc6J4TxnPoK6ujeru6Iuzk2COZ6FoZCIZUD5kc0sshw=;
 b=NFezjMRfXD206MAQ3V4rDGsz8JfEkrSX/MXDPqZaXCWJpz9p4V/nMjThDJRNYbLjRzPXZBYGZkUBnbYPf71bJFu6YRGTaDsNyepm9O7GZ47y9vqSiK5rKhnNJN3XlQqqBEpebmhNp0J3ciakUHXpExX/48blz+CGtZ6UpLN9Bq+VhP6cRY3EPiBqdHVu6QRwFC5t8VK+JI9BafVtzwqu/a1UqfebDDI+k0emWH/OCJaOXrsvPzfLCUB2SKp/Q2aQldsbPylwxdNq4lZyKKeKFxUC/j6BOHkRxK9egxkaJzBG23GwHuVqAsSjgxTWsoYYyG/aUkHrQUgF1X21wYrj3Q==
Received: from AS4P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::19)
 by PA2PR10MB9176.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:37:49 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::5b) by AS4P195CA0029.outlook.office365.com
 (2603:10a6:20b:5d6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 16:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 16:37:48 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 17:30:19 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 17:37:46 +0100
Message-ID: <98b4222b-c95c-4540-b9c4-6c3791f573b2@foss.st.com>
Date: Mon, 27 Oct 2025 17:37:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214733.181352-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251023214733.181352-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|PA2PR10MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5a4c7f-b750-4e34-9f81-08de15772a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmhEVlhjcXZXYXNmOHBTS0hxVkZyK2J0LzBkUDVVL0dBQ0dabEpZZms4RmFU?=
 =?utf-8?B?SlZRSEY2djljK0ljSkVHY3lxUXh4V09tZ1pJTFdBNG9ETmRvWUo4Ri9ycHRS?=
 =?utf-8?B?THI2bmpuYkpKaDJDMWFpaERrT3hKT3ppWDVpeWd6ZVBuWjBFaDlyU2JUdGhU?=
 =?utf-8?B?ZnhMQW9NOE1FM1hoYVk5bVpCejNhdU9uNjdaY014dWtLeFpxdzZZY0xTODBN?=
 =?utf-8?B?dGFDY1R5WDBpTVM2OE1DQVkzbGd1UFQ2b3FyN1JJT0t4MVBhN3gzTTRrQUJ4?=
 =?utf-8?B?aktaZ2ZsajI3RWZudElwOE9DMFdsS3AzZXZnb3JuSlFidW5pNTdKQmlQUlA1?=
 =?utf-8?B?aEdJNERTWWV6SE80aENnK0FrdFVVMmxxLzIyYkFYdzJtMG9WZ25lSS9EQkxI?=
 =?utf-8?B?MFNCVjBSSWVyS0FOYzE3U0ZONHNFQlRkVElLandpMmdRS0RXekFCOTA1ZkRy?=
 =?utf-8?B?T2xKSmNLT2FjRnRzc25iU3lJd0g2TGdDSVI0clg1b3AvWWcrNnVSbjkrQVE1?=
 =?utf-8?B?UFd5c1ZtSElOY2xMTFpHazY5UURjcStPSmdxeUhxa29HS1U2K01LTjlrVTRL?=
 =?utf-8?B?eVFIWHIrWGlrUWJURGVaRFdWc1pibDBaVWtidExRaGdYOFp5WkQxVE5wbGIy?=
 =?utf-8?B?aGR0bndTNUg3Y1BkSTBtL05yYi9wZEwzd041eWE0VDJUdWQydDc2eUI5eWth?=
 =?utf-8?B?RW5qVklCWml1OTdQMWFuQ2lRUVM5WTM5Q0J5bExIckh1QUlwazlqbWZvRm1L?=
 =?utf-8?B?TmY4UWE1V0NNR1ErOWIzTkZRQ2RoWmp6RHhZaEdHSkoySEh2SUVOUFVDRzlL?=
 =?utf-8?B?R0pRdS9KcFRZV3JGQ0FVbHJFb3JlWjgrUEZEYk1zYVVoWk1KNnkvejVHazRF?=
 =?utf-8?B?S2ZYcTNNbjJ5RHU5MVRNVE1QcmdJL05pQVZ1SGxkZTFiVTU0aTExNVFFMmlj?=
 =?utf-8?B?Zi92TzZjRzNqc2taODZyNlN1VlBPYVJmUlBNeHQwYk9LYjdSWSs4TCtUQmZJ?=
 =?utf-8?B?RWlCSGVmYmZCN3QxcW5Jb1VGVElHbGF2cFZUOWxnRUU4ZFl4LytVUXBydy9B?=
 =?utf-8?B?SmRTTlVDK3dnaFpQSXMwTHlSekM3c1BuaUdXNW9tWFAzVGh3dVcwQ1ZOc0tL?=
 =?utf-8?B?b1FuUFd1dVNzYW1CNVBNUW14TlhPN3FQbDNiV0ZxSVF5YVlhR2FxV3UwMTNY?=
 =?utf-8?B?NHRYeDZkU3JEUklmTGhBV2VSN05DdHJWOVphcGFJcGFXVzJXN1JPQldwMy9q?=
 =?utf-8?B?d1VuaiticW9xTWFWeHZITHpTak9kQUplUkZNd0lVZExCaW44UEdlUzhXekVm?=
 =?utf-8?B?L005a0FaZGw4SGJ4eXNpUDN3V2xhNUViUkljV00rWWp3NTJxNlN1ZklrdTVj?=
 =?utf-8?B?S0VaazJzanZTVTg5VUFvT1I2TXVUNDNTcGN0VkdWb2RQbGVSNUNTbG5BZy9H?=
 =?utf-8?B?RysxOGtzR1grUXRkQzgwbURLNHQwMDdaWlpkTjZ0d3RJVk1FZlRMamdySEpw?=
 =?utf-8?B?ejI1UlBFN3BVNytReDByaEFwb3pzb1o1bHhlOC9PcFZLSDY2dHNKSWpLZFhU?=
 =?utf-8?B?T2RDcm9BTllDRzBsUXNYak5ad043NnBtRktRbnNDVzFOUUZtSVVBNlNTNGpK?=
 =?utf-8?B?aWU1UGtWc3l3SkpYa1dJdE1KM1F2MVBNUlptV25ubDNoaTJJQThxNldnZjUr?=
 =?utf-8?B?dnRGMWROU2hQSVBZSjF2U2RtTzZibmRNd3VNRFpqRXMyTGM3SHMvZW8vME9E?=
 =?utf-8?B?VXJIT3cxeThxNTN1VnFBVkVWTUxYM0RYRjR0VGxvTnZkMkF4ZkQvdzM0TjNz?=
 =?utf-8?B?UVRjRVAxZmZKS1lDeERZcnhTMHp2eDlCOWw3QlJNcjd3aVZER2tBejB4eVZ1?=
 =?utf-8?B?Qld6a2tyQ3ZiNEFYQytWYzVuNzVHQi8zNEVFcUc2K3NvQ09QYWg1bTh5eHE1?=
 =?utf-8?B?WTE5VFcwM0tGMUFKek5vZyt3RWJLVS9wWkhVVzRnUmVaMksyQy9MaVhwOEZo?=
 =?utf-8?B?RDc2cklzckw4WkdId0tXZXBoY1d5RmRHbUhHamdqamkxVW55Q2NOOWtDU1BL?=
 =?utf-8?B?R1NIVHRndzUyMlZJbVVzMFhFZXJmU1NidXhMc1JjQ1ZEMHdUZ00wa21Qakdy?=
 =?utf-8?Q?ofgA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:37:48.6548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5a4c7f-b750-4e34-9f81-08de15772a46
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9176
X-Authority-Analysis: v=2.4 cv=P+E3RyAu c=1 sm=1 tr=0 ts=68ff9fdf cx=c_pps
 a=ECbzqkp4a+S0KsFAOAVhYQ==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=333h1EmwPJ6uH7mi9Q4A:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=HhbK4dLum7pmb74im6QT:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: wDvyjNhsadTXoG1Icuy8m-ZXZYwzB-vD
X-Proofpoint-ORIG-GUID: wDvyjNhsadTXoG1Icuy8m-ZXZYwzB-vD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE1NCBTYWx0ZWRfX5QjWKwaLiIUY
 KZOTv72sCMtPkdM6zCsnI7y/ifkHAeht9W8lqV3fNbY2xgL3lm1eGXbNe2Huy5lBIdTGL9Z4AYQ
 4OJVGmKp7HKcWdZqve1Pr8Vmxf06F6QSgY10T6BD1rLH8dhF9UvnmHczGr4sosBpXlfmZxKssIl
 8r01MPLC7e3VYhbDJdkyII7vqndmBIZRiEWVAHflAdilGRplz4Xo1Mn633KjCJQyQalGsu/TfJL
 emXlP1kVgwyMGv4tqrJdwEBGGBKDRwYefq14Rtv9op1duR3Ax8/KKSXJI0UF4dSeB0gSJQq1ma2
 Bj7YAoNqOdDO3iq16Fe4Y0EIkWkjwjeVFPvH9KRqE7A0tDfHChXuEFtXJbKzVgA/mwuGnB9I8/h
 +3aibL31rW6g4CcZhpJuE0xUQ4jLiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270154
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Keep the reg11 and reg18
 regulators always enabled on STM32MP13xx DHCOR
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



On 10/23/25 23:47, Marek Vasut wrote:
> Do not disable reg11 and reg18, disabling these regulators causes
> the SoC to hang.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> index 699ba15d6ea..5ca0258e3ff 100644
> --- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
> @@ -186,6 +186,14 @@
>  };
>  #endif
>  
> +&reg11 {
> +	regulator-always-on;
> +};
> +
> +&reg18 {
> +	regulator-always-on;
> +};
> +
>  &sdmmc1 {
>  	status = "disabled";
>  };
Hi 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
