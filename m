Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA50B8521F
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Sep 2025 16:17:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 077F0C349C6;
	Thu, 18 Sep 2025 14:17:06 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11BFAC36B13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 14:17:03 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IECqWw002421;
 Thu, 18 Sep 2025 16:16:46 +0200
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxhs178-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Sep 2025 16:16:46 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YX8kmCgbzzMYYF4bR3V/Ul008dsl5V0mMp2fqeamJ99JwgdijzS5U/uC0kPCC7+NAxN2XWS5c8+et6L2TItq/YYsbLnAWA/0Q6EYSSgbc9XfwFfDc90/mzK13cxcXlHyBEKxipTbYn49OhldzoAIdXq3SYAEQg0gjRyve4LS8FlVEcnaUPtZKncpZefsQEpjDrXXt8xotCZdZBfVrAKrxccP3juwSzN6NT3uu9zUHcEJiTc1dK3m9Oul98mokw+BQ5he23aqU50uq37r6wBcI1EqVIJ9w5QqP6LwaTEQRujeplyw7RfEuedC73rtirVKfsopYrcgn9FNnjt3BSs1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGN4MxybYnX2s5ogEWBQncWCP5tLL8TJzMLZLDaLRJI=;
 b=a+9sJzYpZIa/ckHLmHpaglsgpiraquLBbJlK1X2LCpa9qJGBl1RDWMIEPWGKYvcodl2zwbYSncsgg57NkdiSgrtUNcOel0IG+ufhWhwBG5e1kUf09C+fFyMfSBRvUcW3QA0qwtDybbUHheAChV9EdxuxDpBbvMoz37kCNvVV5mZANTwyif3IrON6/wpUM8A5zm+hnDN33BxqUr8/aA7J9rTiFOBTorfHHdKsDt50U86i74UotuoBgUYcg6KpF41S1RCDXXLSFkFSpYXQcipQZNBe3ynT/rgvhf4WS86ACoLR9aGf6eR5X07v/YYBo9cxiSxTJwztWPzmAPrTNQbo8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 164.130.1.43) smtp.rcpttodomain=bootlin.com
 smtp.mailfrom=foss.st.com; 
 dmarc=temperror action=none header.from=foss.st.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGN4MxybYnX2s5ogEWBQncWCP5tLL8TJzMLZLDaLRJI=;
 b=ittNUjv3q6fF9YTn0Df53RvrarAO42A2eVQbWxMI65LMyolNbhacXKrBxeyD7uJMYV3ApxV5SKKJPPweY/fCUCFxkWN1fvv5QsQfQ16S/VhYw24FZH3M5OHhQUyb2j+nnufgtWvdJ2rRKW9M8LRB4cCpHqeIQwwokQZxQw/8xbk8tKKLbvNRa43Otln2sgJcZzdK2BKi2BBSCnEEuwb/CITJaWgZpT0sOe/KgIdkGg5RYa4YDn16SFBneyLrqhIIdyYf4bPIvQciKfYhRYOw5MayXmWgC8N082OYYbNugGKP+ePxXQnzyGqhIlbkYZrfzkjCWx0PX8KAidm/4YSpmg==
Received: from DU2PR04CA0225.eurprd04.prod.outlook.com (2603:10a6:10:2b1::20)
 by AM9PR10MB4102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 14:16:37 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::f1) by DU2PR04CA0225.outlook.office365.com
 (2603:10a6:10:2b1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Thu,
 18 Sep 2025 14:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 164.130.1.43) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=foss.st.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of foss.st.com: DNS Timeout)
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 14:16:36 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 16:14:11 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 16:16:35 +0200
Message-ID: <55d0805b-dcb2-4277-a4da-f4c26b48a2dd@foss.st.com>
Date: Thu, 18 Sep 2025 16:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20250917141736.59732-1-kory.maincent@bootlin.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250917141736.59732-1-kory.maincent@bootlin.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|AM9PR10MB4102:EE_
X-MS-Office365-Filtering-Correlation-Id: fafd7fd0-6fba-4cb6-e191-08ddf6bdfa9b
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0J5dnVrRWlhdnZIQ1FJSm1uYjhaWVRvSlpsQkxNTlA0QnVrckxUSFk4ZFh6?=
 =?utf-8?B?NTRZL2xKVWJ3aERsTWdFNTQ2YmxVcjZ2aGtra2o4V0FzS1F4ZjZzNkNNNktS?=
 =?utf-8?B?NG9ETTk4aWd6OWxWNDdLQVBOQzZvN0hoNThST2hwdTBQRVFoY1pINlBtdFYz?=
 =?utf-8?B?RmJ4am9jREwrZnJHdmliVkJkNjlubTRUWmE1Y0FxRWhXdmJ6cnQxcVVyQi9i?=
 =?utf-8?B?TEpaY2tPZzBybGxsNFZuVUk3cWFMZm1uZ0ErcWFkV0NndWtwMjNFOTh2aTNq?=
 =?utf-8?B?bU0vZ24wWkl5UmE0SkpSRUd2MG1lNlNQeXZTNlpJSXhWZFBoazZ1Q1RNbWgy?=
 =?utf-8?B?VWVUeFB5QTRJRkU3b2dwNFRXNElwNE4vb0FJTjFQNmNlMFZCMzNxa0YwWElh?=
 =?utf-8?B?dyt6UU9DUFN5bUlNdC96SWU5aytULzlkSkw3Zm1zMWZuQURBUzlQVnFkOTlV?=
 =?utf-8?B?Q2hBYzFEcktjZlBmSWhvcURPZTZGblkzWks3Q2U2Slo0TlY2WWZ5a3h6OW95?=
 =?utf-8?B?dHVWUFY3RDFqU3RZR1ZNUU9ETkhZUkxON3BuWG1DRm9tQU9sOUcvc243dFRR?=
 =?utf-8?B?V2tPUlhkcWVPMmUrdm9TcDIxSVdHK3V6Z05nd1dHMFpvcm45cUtLMnVxdVV4?=
 =?utf-8?B?aHdEc3hNMkMyK0NUWkNmZXRITUFtSHdFeWwreDhxQzRmV2VHY1J5YWkzUFJS?=
 =?utf-8?B?elNMMGk2K3ovRGNMYmNkakVuYktxK1hqdWFlVDlFWWlyeFlpVS8vSms0d3NN?=
 =?utf-8?B?K3hKdVRQVEw0b3FSZmxDSkVDaVlxclU0MUhGWmVIdHFDdzlic2tRK09peEl1?=
 =?utf-8?B?Z28wUXpFUmI4bDdwTFl6cGZ6U09UU2d3eGllcVM4cEJUU1J6Q21NZ2tFOUZl?=
 =?utf-8?B?b2puOHhuOTF3eVFQak5PK2ZtVkFkRVFURTVzd09vaTVmZ0xFcGw3SCtWVHZz?=
 =?utf-8?B?UzNFTjdmSTNWQzFxVkxaUUJRUkJFQmpEeTMwdjFvaGlXUzFzR2Vlb3NCendK?=
 =?utf-8?B?OUhTRURrUWFYL1JjM0dCVHErRmlrenZyRGdpakVzWUc2UEhOVnd1Q0l3VmtC?=
 =?utf-8?B?T08ySWFVTHVsakFZNjZjTEdOQVZNcDJMbFdOYk9jU0ZFQ3kxS3JuaFhoQlRZ?=
 =?utf-8?B?YTBBWXNaM1lFTklyZkNJdXNZVDdOR2hkZkpCaHpCakViRHZWUXRDS1VWU0xL?=
 =?utf-8?B?OHk5SXVnVVRnR2x0WjdGU0N4Qm1nTXo3YW84TmZiOXRra21KYzFGZ0V3N2xZ?=
 =?utf-8?B?N2R2ZlN5K2JYdm5pVGxHWHlqZ0x6T3NyU1g3TUZnOUw3b2FpVkprUmdmNXlm?=
 =?utf-8?B?a2UvNUlQNnZGamFwUlBaTVFmNldVaGhIb2lNRElxb0xXMndJaUwxc1g5SGNn?=
 =?utf-8?B?ZkUyMzg3TDh4dnc0YjhNem52aDlaTGIxODNXUXpDTDFvdjRjS2p4dm4reVRs?=
 =?utf-8?B?M2RFeDN3V0JKV1JZK2VDREFNaWM0UnlDYitjZE9NL3dRQmFCcW9zTU1RRUlJ?=
 =?utf-8?B?d2FkcFQ5ZkpOUjBNTHd2eFVLTFN4cFQ3RzZCcGRKVGVLZEtBSEFsMEw2TVc3?=
 =?utf-8?B?bWJCbkdoUjNwT01WblFqWDM4QXo5TllMSlA3TXcwbVRLellXVHdPRElsR2ZC?=
 =?utf-8?B?ckJpd0NzRTErRXd6aUVvdkhGS3ZXM0VNcDlRbnBOQXdTVVJOSXVGU2JtL1dT?=
 =?utf-8?B?Vk9MbFB0S0Y1YzhMcFFOMjRTT1FqeGZ1eFRuQklLaVArNTNRSDhIY1J4aXJz?=
 =?utf-8?B?dDZjL2tEbXdtY0duUGl5WC9CVUxBMU4yb0dQbytFaTV0NkUxaU9xSW1aR2I0?=
 =?utf-8?B?MEdwbXhzT2tzZFJWRjlzdEh5Z2ZVSWlESnZsaC9mMk8xNUsrdFZmSmhpWktL?=
 =?utf-8?B?MkMxMUE1YXlnWG1uVXJpbC9yYXdSMHN6THpCb3VwYUl4ZjJpekkvcjVHaHhE?=
 =?utf-8?B?akFsb1RwTEhLWU5EMmhlSVI0eHg5SHRMZklxWUw0TEJ3OUkyTHR2S0NqN2p3?=
 =?utf-8?B?eTk3UmJDOW9IUGhjY3V6MlBOZ0tGMFIyREhoQUVQaHhqUjNRbkJ1SEFHODJs?=
 =?utf-8?Q?NNaEVi?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:16:36.8979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fafd7fd0-6fba-4cb6-e191-08ddf6bdfa9b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4102
X-Authority-Analysis: v=2.4 cv=K9MiHzWI c=1 sm=1 tr=0 ts=68cc144e cx=c_pps
 a=SFSHKXAgSQVBTVEpFOQkDg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=P-IC7800AAAA:8
 a=8b9GpE9nAAAA:8 a=dRRvcsE0UW4FUMw8ylgA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXw9QWClwGr3hm
 p/hwZHj6XlYmmTWv8iSJxFhFD/snaJgkWCSejdnJOOM1GqVZhjHkhZQb8zol/PZSgxdS8xZa2b5
 IsVKubH2rto11dac0y65oaHpLu1uLCeXNDUFQKrnc9vHgLtIdI2epFuhVyu8Vcjnq4pyrvrsQVa
 FuFvcytwGrRd5xzw6TvJCB2ae5i9R9qeQO3QUrzDguTbW+hy7hioSUV0D8KrhQfhCnworwyKChu
 nE9hzEa/Q/gxXZuy5ZElApuUQMnUdqIL8ZGfMYovbLohT6XFk3Pra/IKodk4DSD6jl54sIYUGe0
 wP9gkMs8KyVxf2lhrUKdjMgUX5v7J9tW8aZSKquXgTnqTQpr/Dz/a2BkRdgh7LirFgZ49xqdBkh
 TEYXg3ZI
X-Proofpoint-ORIG-GUID: wWHoAMexAxRfKFTQY58CoTrWkiJzGbAz
X-Proofpoint-GUID: wWHoAMexAxRfKFTQY58CoTrWkiJzGbAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 thomas.petazzoni@bootlin.com,
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH] Revert "board: st: stm32mp1: Clean
	env_get_location()"
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



On 9/17/25 16:17, Kory Maincent wrote:
> This reverts commit d37641c61ba212241c38e3fd22f0335fc0bebc96.
> 
> Restore support for environment storage in EXT4 filesystem on eMMC boot.
> The previous cleanup incorrectly removed this fallback option which is
> needed for boards that store their environment in an EXT4 partition.
> 
> This configuration is OS-specific rather than board-dependent and should
> remain as it is configurable via menuconfig. Even if it is not described
> in ST defconfigs people may have enabled it in their defconfig.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Debugging this issue raises another issue that need investigation.
> If env_get_location return ENVL_IS_NOWHERE but CONFIG_ENV_IS_NOWHERE is
> not set, U-boot stall without any log. There might be an ENV check issue
> here.
> ---
>  board/st/stm32mp1/stm32mp1.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index ab7af69d472..cb5cab9f36a 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -751,6 +751,8 @@ enum env_location env_get_location(enum env_operation op, int prio)
>  	case BOOT_FLASH_EMMC:
>  		if (CONFIG_IS_ENABLED(ENV_IS_IN_MMC))
>  			return ENVL_MMC;
> +		else if (CONFIG_IS_ENABLED(ENV_IS_IN_EXT4))
> +			return ENVL_EXT4;
>  		else
>  			return ENVL_NOWHERE;
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
