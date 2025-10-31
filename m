Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A055C243E6
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Oct 2025 10:48:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0CCFC57169;
	Fri, 31 Oct 2025 09:48:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FE68C1A981
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 09:48:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V9Xxm53952176; Fri, 31 Oct 2025 10:48:17 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a4t0mr8p4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 10:48:17 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clHpf+FiyJy9Q1anzMXm/+3g7/DWhmjBCDNPd4Nzc8ruYLwDJszcnVjTCmQpwGE2uwDcTXXRrs348a3hN8IG5s+149q5QBnegbGZTTqgSokvcpmIMqSvkm0LvDJeT4GLbGyDxckhGz1/udA22vFpAN9g1MSgGbMcLBWy9bqf0BzhGFdv+MrcaMMEDgOx2GT0xLkXxzyXAzDFyNSpDMYAnPAgc/aY08k3wy+b39G3aMDDNIqHlJCYvzhWkkEcgJ9243HBOPUXdqGt2GUA3VdhZoZbn/yZbm7q6t8+Vm8NjBzolH3f/WmMzKllrdMAVk1DVRRmYglPR5w8C5urKnjFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHYs0faP2UZw4zYCcGX82wSOhR1WiM51o+jM3ZgCcj4=;
 b=IVhMFgALsJKIgTeYmiE9vdI8w6d6m6mbhXeBqNSoP0Z7Nk4dBRUA0aMPgVU8qHa2Um4t+T0QsTAN+lPNY2vuK8a7NpvyIpUcALk6ut/BSiy1MUY2MiXXosd7cFTTkRxBQPlOVBshehE3jnCfkyPnPseBR9YacogY7xniNerIwF5JV4T7kQRdA9QpXbXK/y/wiJcUwd6WLdOkXJ360Wl2Skijcpz10Ap5fXai8p3vL0bsoPwAZbS6Cm+YKdC9xQco3KBaVUu+vfi/o7t04O2cTGVw+KIePgzGNMCjKLDVY3zQCK5C8Z5WxbZ2iJTzJ1uLmCw9hgvGbrA1JQjM86LGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHYs0faP2UZw4zYCcGX82wSOhR1WiM51o+jM3ZgCcj4=;
 b=GfbDdGZgfHYK3xkDSB2uknISDD4MfOkqOKNWP8rzB1Xk/zyrmNH5pfVernVertaD/pAi4C+d31XW6oa+uvZ5q+YLW0Eusg7CdsxvuJD5Q9WmkTYl7u/2Fy01IhCHp3C0Gpn4wF7gSTB4EH+YnIVYB6JIarAGqhR8QVtmxKXtswDFjmkveAACFnJm3E2HAWiVt+dlMIYeZwsAaEsjnbbhHbnynu+BDuSyCv7CL4pmfzSw7mg3L6wCBmlcTPhNPSn4RL0l1HSJDY3N9wWjp+KwK8IwIc3f0ViVCAdy+Y1T2xpAintbRc8Qhhw/jXj2ubiA8B5LrsYS/ZYLdAoMHm0BFA==
Received: from AS4P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::17)
 by VI0PR10MB8667.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:213::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 09:48:14 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::f9) by AS4P191CA0026.outlook.office365.com
 (2603:10a6:20b:5d9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 09:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 09:48:13 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 31 Oct
 2025 10:40:48 +0100
Received: from [10.252.18.244] (10.252.18.244) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 31 Oct
 2025 10:48:12 +0100
Message-ID: <45aac9e6-eaeb-4e96-baba-225a6b63f636@foss.st.com>
Date: Fri, 31 Oct 2025 10:48:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251031041640.174689-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251031041640.174689-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.252.18.244]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A60:EE_|VI0PR10MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5f7c54-e33f-4e7d-ab2f-08de18629bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sk1hMHY4VnAxa0QxMVNmdkdVV0tHcjRocHcvd3BrbkYyYWovODYwcTZiNFpC?=
 =?utf-8?B?cmwxYlhsN0N1Wk55NHpGUE9BWnFYdXljNDVEdGZFZHhNRlN3NkJZdEtmeUpr?=
 =?utf-8?B?d1N3d2pYZFRpMkpLaFFEb0hsdEhrcmFUR0ZlQXdyRlZ3YUk1Q3B3cTBkQ0JM?=
 =?utf-8?B?SzR6akxCdmRFNVFGQlRCRUZvZnlQaFhoR2l4UVp6NldodWRIRzh1Z0dXNkpN?=
 =?utf-8?B?dnB6Ymp6WGJOTVBHQkprbm1WbFA2Q1ZoWDFGNGQ2Zm13V01OTUxObXBMaEQ2?=
 =?utf-8?B?Q200UlBRZysvWlBrbkZmK05hZ2JmOWQ2SDl4bENReEtTU0hSTlArYThkYjVs?=
 =?utf-8?B?TlowWEVKcHVwZk0vZkc5azZuaEZmcDdqbTM5TlgrVTVWWEVXRUtlYm9qZ2Vm?=
 =?utf-8?B?QmlNMlJVb3A3QmNldE15aHhXMWJaTUtCOWVSckVHNHJLV1JIWXZldTlIbzlB?=
 =?utf-8?B?Zzk2UkNyLzlXSHdBVy8rT3VVS296azdOVDF0eGs0Q2xXeDZrbi8rZzJma005?=
 =?utf-8?B?cGFSS3NOVFRkMXZ4SzhvN3lXNWZrSVo0V2NnSTVtV1JZVjdIek53OGtsZWdL?=
 =?utf-8?B?eUpSMFFPZlNRT1M4WmpiTnBxOURrSjViRlFSYjRrak1WVEpMaTUzUVlQVHNO?=
 =?utf-8?B?L3NkZmhIY0IxbG1tdG9WeWdFQkVqQkVVTUlLRWhRSUZqbHl2R2U4LzBnVEVr?=
 =?utf-8?B?SHFDWVh5QVl5M2dyRXNQQkRQUk9SOWpZcG1kVWd1aTNQOTNTT3VTblNnREtR?=
 =?utf-8?B?MjUxc3NFT0FxbkN0Q1drSitQWm5mRnJkSnFUbDQvWEFqamp3bFRpZ1BPZnF6?=
 =?utf-8?B?Qld6NFRieER6b1Z3R2l6b21uWG1YcXh2VXFqWVhVQ01HSjhMUDVDM3dqbzlB?=
 =?utf-8?B?dUh2WmE1bmw4bERsb1NPSWVHS2hKWU9oQjNielFnM01lSFRGaU1seEtnU0J4?=
 =?utf-8?B?RnJJcXRYbnRnd1hrK05abUVrQzBrSTVDSm0xL0JWbmZxSnFrUUtEZGhLY0tS?=
 =?utf-8?B?NjN3aGM2MkVTZk1uRi9iSlN1TGtOK1RJSG5WN2lhcnJFREdWTWY2S0sydU9Q?=
 =?utf-8?B?UUFna3VwUUZ2cWJhc0c5WDJiSERtQ2hmMG1ORXhQZkw4dWNNN3UwNktwT2ZZ?=
 =?utf-8?B?UUJkSzRneVU1ZHpzME1ibDNlb080NWFpOS9zdXZCNWtUaGVjV0dFbFgwenlG?=
 =?utf-8?B?M09PdlBERVMvb0lUTnc1Vzc5ZTN4dDhQQkR5NzdxTVZHRUlkeExVTmR2OU9k?=
 =?utf-8?B?VnJ3YnloL0wvdE9qU0JQZ09wNHZ3V3h1MnY1SzMwbGRTalJxZVIxZGFJK2ox?=
 =?utf-8?B?MENHaDZDN0xkUldJNlNkV1diejFBYXZtanFPNXpyZkU2RU1kN1picUxNZ0lS?=
 =?utf-8?B?QnYzalJDM2lJTlpveWJTNm9sSUU0Nm5MTmVoZFpScDJJeUs3N0o3OEM1RG0v?=
 =?utf-8?B?RVRTMElqNVJTQ3haaVBoOEZObWx1N2huRkxBb1lxdGRkdS81b1NJb3hFdWhE?=
 =?utf-8?B?RHNsalU1djlMeThPcVB2RE9uNEJreVJIWlVsZFJqNU1vYnRDTG0zRlVhYzVN?=
 =?utf-8?B?V0JUNi9xWm0zVktqTGZ6Vm1hQWJIOC9Pd2ZHc1ZueFpRa1FhNTV2QXkvcGxN?=
 =?utf-8?B?aDdnZWsrcVJjMGpSQWxWY3J2MDBDSkZjR3Q4cWFVZmRTS1ZsZ01kL2Q4aDFQ?=
 =?utf-8?B?NjVTUnNyRE9PNjh2RjE1d0JxVFk4K3gveXFzRjFTS0lKOGR6dFNsaDQzeGdr?=
 =?utf-8?B?WWhSTHhCK0w5bS9Mb1FDVDhtZTRYZjB4M1hzei9rdlBLdDl2YzhJc2VNVGRm?=
 =?utf-8?B?eXRsdUNhZmphaG1xYm9tN2ttWlR3czk5enhna0NOWnpyZUxrNkFiOUp1OVFl?=
 =?utf-8?B?Wmg2VHlxS3FieWxnWThzRnQwR1p4VjhvVTh0TWtxeEdsdUpuY2F2ZTFGUjlL?=
 =?utf-8?B?K3ZVY1lwdGpUWG5YdytCaURTN01ZVWtWdExKS29RZWl6UkJHaEJVd09OcUZq?=
 =?utf-8?B?dnFwbUlLV2FPMXJwQytwK0x6dklGejRselRlUGVCSFlmWk1rNUJMRzYzVnIy?=
 =?utf-8?B?ZGMyMUFNOFYwc3BkRlBjL3RINDBmRkxySDhrdXNxREJmYlBNZDlzaTlpcnl0?=
 =?utf-8?Q?ADuo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:48:13.4088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5f7c54-e33f-4e7d-ab2f-08de18629bef
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8667
X-Proofpoint-ORIG-GUID: fKeRDjgpiLDv69RsPgel63dlSJTaknro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OCBTYWx0ZWRfX0Lxg6mcDDEk9
 FFEKMPx6aZYKy4u58YWAK1WtzSNqo434BX5tfHsvpr0QFu2vmvJIyw5rqByTMCYeMthKUOeG1SA
 eqFgF0uEwciLLXR4lMlhGO/loqpeTKaQGdSd5S+qU5uNU8LS9bfcZ1xiyilvQ2hOihwep7+DeTN
 v4eLzvy/y8FLskWFlNbyd/23hpfPrTvXvQVK0dtdtQKTbppTz831lDc966q43f8sEcRemL/jtsA
 qK3bVQD2O1U3aWyfUab6YXa5V00e7UCbfVKicghk1EH5xej86Isv0yM0+KXCIS+8qf+CJWpueeZ
 DyidgLHuNatemr0wG3W5oiqinOm0ykzWl0hBrUcYdoZZwqA6EM8pWlAtVrFnQWm3iaAwjxhCV2H
 N/EUrmrfMgYEEdGv6fQLvUjA62CaYA==
X-Proofpoint-GUID: fKeRDjgpiLDv69RsPgel63dlSJTaknro
X-Authority-Analysis: v=2.4 cv=U/ufzOru c=1 sm=1 tr=0 ts=690485e1 cx=c_pps
 a=mucXRGHKJBmRlkbHDuFPWg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=F4d32EgQ6_0A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=ZuHQpEm67TBVP2XyqMsA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310088
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add missing build of ST DFU
 virt code on DH STM32MP1 DHSOM
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



On 10/31/25 05:16, Marek Vasut wrote:
> Commit 6d91f0a3a14d ("board: st: common: cleanup dfu support") split
> the vendor-specific DFU implementation into two files, but failed to
> update other non-ST boards. This did not lead to noticable breakage
> with plain simple dfu-util, but it makes the ST proprietary programmer
> CLI tool end in an infinite loop. Update the Makefile accordingly to
> allow even that kind of tooling to work.
> 
> Fixes: 6d91f0a3a14d ("board: st: common: cleanup dfu support")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  board/dhelectronics/dh_stm32mp1/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
> index ffd221ac224..2f4a301d1a0 100644
> --- a/board/dhelectronics/dh_stm32mp1/Makefile
> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_PMIC_STPMIC1) += ../../st/common/stpmic1.o
>  obj-y += board.o
>  
>  obj-$(CONFIG_SET_DFU_ALT_INFO) += ../../st/common/stm32mp_dfu.o
> +obj-$(CONFIG_$(PHASE_)DFU_VIRT) += ../../st/common/stm32mp_dfu_virt.o

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
