Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E1CBABE16
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Sep 2025 09:45:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19B43C3F93C;
	Tue, 30 Sep 2025 07:45:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FA65C36B1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 07:45:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U7eNiO010369;
 Tue, 30 Sep 2025 09:45:14 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49e6tet54y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Sep 2025 09:45:14 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQlYrep2ABc+u3dYiPfDs0Xhe3ebbXME7Gkx7tw5g1q0HJLECXS537DDxTEUJjFbdV1Fy6RLh3F8t7qtPvGwyXI1UmWhBJvCsS0Yi3g7T/0IvrehZCwNnSlDSAtZAijg9uGwuhlsYcnTWbg3agvlwK++DXmg/+5te5d4ty8zoBTwNrkSdavZGlR5NURVHsSbZGcaXb9rRbfz5an9g60V1ve95WnraPySE7fe2PT28jxgcvA3wFRJEDZcPLuZNQcJRnC7u833K+CKfvba+UY3iIl/hAR++2tYSVd8LQmrVlyQs6q3/W0DjKscc60SZV96weZTYVdMHu6KsChjj7Tkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTteqOAT7AKOEOmF9YBQ0+jlgOd2XBh6wUBSC0R1634=;
 b=W2F+f/oUKzwCsdfwCRmMwbZa+5oPvMQelmvYACbEP8BsTLtWWumxBCz6A5+VSVNkRrWBbO3+Vsy/bXMZ/DQCk3gdf6ktwZQUoYuPG9n8HhAWy8YOiBU4Pf+njhKl55Wl/tjXF8QnBpuJCZBO73myMmL5GK7m/ZkkgjcrdAmGMRs0xx5UkwNG/5uJcQoSyHR/izTVcgxabEX9h1e0C8KtxWxVzMYY2yYzoYaKnRY3THTl7QpW3gZeXApIkethAiBCNCpKMllXutgULDK5rWOPK/NDn10lGp5/poAcqIIZ54QBevlw21b+24qltoc5QI9AOAepEVxR6ga1Ox2+6qzZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 164.130.1.43) smtp.rcpttodomain=bootlin.com
 smtp.mailfrom=foss.st.com; 
 dmarc=temperror action=none header.from=foss.st.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTteqOAT7AKOEOmF9YBQ0+jlgOd2XBh6wUBSC0R1634=;
 b=kNZwY30OXsWIibKgtzqYJRl2pcRxyFtydu2f9osvyM0VybWeChKPQQWtXlzm00AtpcqE/EQx/miKvBFounD0Fiq81KfWvTUsy1XmzA+MYWbM/BnTkqkTaKTpRy8SeuYT0wwaXxMtUTr2wfsfZZDehmUHecPVH91ptDQE5Pfk1p2DiKCh4rm/F5FTuSVO8H3wWR3eQZ0Sp4wmfuIv8p10IH2vQ58EjARxmcnD2bbWdYi3eJYnEI63wgF0+RAQl8YNvojoueA64HTeZUIQOd9WXEQD4QM9Crl9L6eUD8Zv5g6hj2iNxciiaLiKZLBizjjvt5MZLcWmXovaI8NHEwW+rQ==
Received: from DU6P191CA0066.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::6) by
 DUZPR10MB8125.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4e0::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 07:45:10 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::3c) by DU6P191CA0066.outlook.office365.com
 (2603:10a6:10:53e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 07:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 164.130.1.43) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=foss.st.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of foss.st.com: DNS Timeout)
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 07:45:09 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 30 Sep
 2025 09:42:52 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 30 Sep
 2025 09:45:08 +0200
Message-ID: <fd32f45e-a3c9-4170-8886-5a31dda0e4c9@foss.st.com>
Date: Tue, 30 Sep 2025 09:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>
References: <20250917141736.59732-1-kory.maincent@bootlin.com>
 <55d0805b-dcb2-4277-a4da-f4c26b48a2dd@foss.st.com>
 <20250929170912.3bee3f9d@kmaincent-XPS-13-7390>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250929170912.3bee3f9d@kmaincent-XPS-13-7390>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|DUZPR10MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3fcbee-bb1c-413c-af84-08ddfff54821
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1VoMDgvbmJpM0VEK1FRZXZDQWNHWlR6YVF0UnNnajhSVmZjSWpzVjhCcGtF?=
 =?utf-8?B?bXNOWFA4b0MrNE8xUUczcktXbXZaT1I5dmoyc3RHVm0wMTd1OG1VMW80TVZK?=
 =?utf-8?B?bEVYWnBIYTBFaGtzdUNHcmpWV1JYcFR2R1N0YXJQSmRFa3EvNXF3OEZGeXNi?=
 =?utf-8?B?T0RwUndESW1DLzdBNUhPQkU5ejU1UVUrTXB4UmI5YkoxZm0ycHFGOVNlOWZV?=
 =?utf-8?B?LzRzVzl6VHF4ako2dWZIQ3d6VGkzVTFoajB2Uk9sRlVuRWVLV29aSDIvYllv?=
 =?utf-8?B?QVJuRVV3QUN1MmVrQUV1MTdvemdNaUVTK0xBMDRob2F0RkN5eFcvbTJFRUs0?=
 =?utf-8?B?MXdaazkzOEQwVkl2RnovSHFxZk9PZGNjWlNEUGlFSmFRWUg4UmtDaHdMbkNz?=
 =?utf-8?B?aXNYakJKc1Z4bENxanh6ZHlaQllRdElqdHcydXQzdTI1VWlSWlhLeVZKL0o4?=
 =?utf-8?B?UWFLclhnaWhEZVRjUjFxNWE4M1M2MGpQS0ZWTThvcENLamk2U25BMjJwN05Y?=
 =?utf-8?B?NUpqOXhXekplRjc3Q3l1OUg4WTJRWmhDNUh4NWJ5eGt2eEt6WU9MczJVeUlT?=
 =?utf-8?B?dnZOK1J0V2dvcjZzUGpIc0J3TEt3TGkrQldjV3F6bEM4YkxFQ2Q0SVhDNVg2?=
 =?utf-8?B?SEtCVUZ5V0NETk5BVEF4T0grQ0x4bXdEMnVTU1BPVUtkN0FnK1RaMUpQNDBn?=
 =?utf-8?B?YzdVUHp1bEVTQnE5SklRcTUzZSt0Q3N5Z2FabERVc2p1R0lHMUVqWnkzZzd3?=
 =?utf-8?B?TytsQ2hKM0l4ZkxYRE5KZENGUUtDSzRwVGs2MWVGNE9DRi85QVJVUUY5eEJ3?=
 =?utf-8?B?RGtwQ3BKeEdhUVZEVExHK2ZSRlhEdlJSR3pGUlpDZzVtWDJBdEl5aE5nNC9N?=
 =?utf-8?B?OXZmVzJ3MHpJeUw1dDJSMWg3eXlzN1BSQThhU3RWLzBRVTNqNVJoWmdZcjdE?=
 =?utf-8?B?MFhZakhpQ3Jqb2JJNld5U3NzZWQ4QTMrV1V0NFdBVFZBWXphdU5PRXhqTUVa?=
 =?utf-8?B?K3dhODk0K3Q1WlkxMlptanZmcUJqdFN6M3AxaGdvK245cU90RDhSNktWWGVa?=
 =?utf-8?B?Qy9jYWtjRmpjdlo0aEFPY2Z3UGNuUTU5aExEQVdFeVpPQW1Td0FtRWRHSDNP?=
 =?utf-8?B?MWorNmM2eUJXV2Q3V1pSZmE2b2ZIMWRCUXVKNVpBaUJjMnJZckZYTXBIZ0FV?=
 =?utf-8?B?U01GVXhwU3hDaFZhS1lrWDA2MS9HM3hRQ0hFQ0tKekxkaXRJaCtyOTJ0Z1VE?=
 =?utf-8?B?eS9sdzdmMWFsSy9KS0FwNTRnOWFzMDZhY0N5VzB2aXllTGdNS002ZkxjQVRK?=
 =?utf-8?B?V0crQlBlNTNqQk81eGNnQlErRHJqbzc5M1pTNXByMmFWbVVPU2VHWUQ4OFNR?=
 =?utf-8?B?ZXlSZE5PQ1UydFRFMktwUkFKNHhzcUk3UHo3RzM3WDZ6MUVMb0lrZ1pLcHZs?=
 =?utf-8?B?MmhaeDBNdCtrNU9jNmVWa2hySEdnQ0JGQlVXU3IzUnZjdUJWVEkwYmpPNVF2?=
 =?utf-8?B?eXJwamhCNnhZQW5LNUhDTnl3cTJRWUVGTTVCNjU4Uk1IN3NSa1BBQ2VyTStp?=
 =?utf-8?B?aGN6Y08yOUJ2dFlEWkRnTjdkWVh3SDZOL3J1NnRVbS8wcXp2TzFSRVdRVmRl?=
 =?utf-8?B?VXBpRTAwclZkaVFZbHBtQU5Uc2xPSndWY0VLWjhHZVNsOGdCR05vcnF3Q1BP?=
 =?utf-8?B?a3RQWFFNZ0M5M1BRRlF2N3EvbWc2TVdpaUY1ekhEQWk1WU15V3llQW50TW5S?=
 =?utf-8?B?bFZwa3E5SVd6NFIrdzU0eDB1V2o0eEYzZVJyYVJHNjVOVEhIV2lpYmFneTI1?=
 =?utf-8?B?U3FKRUhkZkZ3eVVhbDhtKzdaT1ZrQTVIZVFTamp3THFkejBocytITGM3Ukpn?=
 =?utf-8?B?NXZZK2JwWlU2eVFWTHowUkpQdGVhVkVTdGs1dzA5OXcvMGdEa3ZVT0FuSEF0?=
 =?utf-8?B?bUd6ZHhxQ0xwbVRvSVovV2loeHQxRDN6QUkvSWVtWml2d3NPdGxGdm83bDl5?=
 =?utf-8?B?aXBHSnR0cnpZR29VNW5SdHRqbWxVTHRCbUJwTDhNSEI4cnlXNi9VcmNLSFB2?=
 =?utf-8?B?cDIzSGRYZk93WGNnMHlLR2xnK1QwZGJja1FwK2NTdHBacG5yTUpHeVVlRXRx?=
 =?utf-8?Q?pFNk=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 07:45:09.7277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3fcbee-bb1c-413c-af84-08ddfff54821
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8125
X-Proofpoint-GUID: O91e4KvMil_ooeWHstlYUUjGxQdXrMdv
X-Proofpoint-ORIG-GUID: O91e4KvMil_ooeWHstlYUUjGxQdXrMdv
X-Authority-Analysis: v=2.4 cv=IY+KmGqa c=1 sm=1 tr=0 ts=68db8a8a cx=c_pps
 a=aENNojP290uMZkO2s5RJcg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=P-IC7800AAAA:8 a=kSzfWeL1cq06ExgGgkwA:9 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=HhbK4dLum7pmb74im6QT:22 a=cPQSjfK2_nFv0Q5t_7PE:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX7lAI2DKug63Y
 C25oAVT/BtWQEac8Agz/BxXkDLKWTYue5tdZewhWiLQD1ke63PbC6DxVEmOOx768kMB9ZXjVOVE
 +wCoWhM87N2i9Q+BhZ6vWUqmK1j031Q8mYHtUVqPI24jVVpBDbRnGWL5ZpVhi0KNPZhXhP323wx
 U4vmi+/pTL6d0VyeSSzcZ69IRKXS4jAIwsF0JcBKk3qI6n2Q8XEQemNU5Zf3ScmbQmjOugkp7RH
 AaDDeLWxK+CNUm1uCLFnDDqViKLPL20m0zufXFfqwyuPYMdsLob86Xd6ZAtASG93FWmaD5WrPen
 7lMhnQINcZOn8367S99gXOs4lMxEaFfiwfwfKIYa4VCG9s5PnGwyRxtEC3dfn2w/bu9uk5Givl7
 PHNrHWJmc7izh2DEGo+FP+IOh4NG/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, thomas.petazzoni@bootlin.com,
 uboot-stm32@st-md-mailman.stormreply.com
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



On 9/29/25 17:09, Kory Maincent wrote:
> On Thu, 18 Sep 2025 16:16:35 +0200
> Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:
> 
>> On 9/17/25 16:17, Kory Maincent wrote:
>>> This reverts commit d37641c61ba212241c38e3fd22f0335fc0bebc96.
>>>
>>> Restore support for environment storage in EXT4 filesystem on eMMC boot.
>>> The previous cleanup incorrectly removed this fallback option which is
>>> needed for boards that store their environment in an EXT4 partition.
>>>
>>> This configuration is OS-specific rather than board-dependent and should
>>> remain as it is configurable via menuconfig. Even if it is not described
>>> in ST defconfigs people may have enabled it in their defconfig.
>>>
>>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> 
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Hello,
> 
> Any news from the maintainers? Is there a reason for not being merge?
> 
> Regards,

Hi Kory

I expect to send a pull request before end of this week for master branch including your patch.

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
