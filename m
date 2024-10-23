Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 944CE9AE526
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46154C78F77;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FEEBC71287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 14:37:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qyyxde7OThzQ4c8HxLcieUUSXZhPIPk2e2h8a7qBha9cYvf0L93XvYTrZhYKLDPh6lZhmaYTjx9sALtECL99eaFTzDIzdhRVCmtGUSN9JA3z1dV/JHCqyI00HwuGYwPJxXqWbP1zA77L9nJu+/oXpQlRr3mQEiDRRcKYopIuew9P/skX4wG8kCL4G6PUP4tAeBOOY8XYMwLtIZ+cOFLjv2MP03gMgS36keVRemXF7EJe3KYcFHLzQ2p53eysPBHrBZiKvxePI/SSQ7xq85qqtxhwUWz/ZCgNfv2FyX8TIP/N2xtGDQNF4OIm7m+shcFxB04fjtUc6Sojcg9af41Gyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFMHXI2kpN2RLKb9be6Z7vCfHKHR/XezVDhOH4S8GjU=;
 b=MZrK9x+CGH9m2m4o9e60TI1PTHkCSnDtLHvIZtH+g1UC7HBXXi5QT8S6l+v9kEEoAP67UZn8k+/2+iNKAPSZorQk9s6LsLgUO1S/vMh8vq9nLgu9xlS+PzF9ODrbR9v1vn8d4HOWQgqoaL50CvnmRufdoMwzndNNSgnVVtje/TSD2XzCQRcaCAqYCo1yJpEIw7PHYrplOd1KLfP7LRmthRku2ahUHWM69koqgRjTBpgCthfqNpyvnaXWnE0O2LH7Y61crM60hAaSGPC1Rofou6DH9A5M/Q/nDmjCF/4GFCm97kAi9E2l5iezQNH+nY1WmFf8EbIjIvJpRRbaVrbtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFMHXI2kpN2RLKb9be6Z7vCfHKHR/XezVDhOH4S8GjU=;
 b=G1/UAVygwL7daN+03WLuaddgmcPRXTV1vsKT4H7npViK0XF/NOWueB0ht1JLaYP6sZvgLD/pYcxGzafefmbsA5AYBRe2y4o/cZiIKfHDwOl7bBlYnmahFnmDYUTzCDivPM/e/8+SesXRWF67laNJlxX+fYClWy8W5GJkKdJRROY=
Received: from SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10)
 by DS7PR12MB6023.namprd12.prod.outlook.com (2603:10b6:8:85::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.16; Wed, 23 Oct 2024 14:37:54 +0000
Received: from SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c]) by SA1PR12MB8697.namprd12.prod.outlook.com
 ([fe80::dbf9:f1d1:7c67:f88c%6]) with mapi id 15.20.8069.031; Wed, 23 Oct 2024
 14:37:54 +0000
From: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>
To: Marek Vasut <marek.vasut@mailbox.org>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel memories
 support in QSPI driver"
Thread-Index: AQHbJMZY/tA7en8DbUuS+Zl7COVM+rKTqicwgABbA4CAAAHK4IAAQkAAgAAX4vCAAAJngIAAAMPggAAEBgA=
Date: Wed, 23 Oct 2024 14:37:54 +0000
Message-ID: <SA1PR12MB869790C1B058968E33C891CF984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
 <SA1PR12MB869767A8D003AB114830D46A984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <03389ee7-3da9-4160-a193-00fd517ad56e@mailbox.org>
 <SA1PR12MB869722D8E2019193343572AF984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <a78899c6-aecf-4eaa-a9c9-8f11758542cd@mailbox.org>
 <SA1PR12MB8697E723395F31AEFCD1C8F1984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB8697E723395F31AEFCD1C8F1984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8697:EE_|DS7PR12MB6023:EE_
x-ms-office365-filtering-correlation-id: edae9bf4-d5ad-4aba-2a47-08dcf37047ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NTNIWlNzYk1EYjBmdDE1dVVob2d3MXVHenZtY1lIWEl3Yy8wdE5pSE9xcFBW?=
 =?utf-8?B?ZzBjaWt3WVhqYW5EOURNajVBVFZ0b21URDh2UGVtNFRTL3R4eGhsMmM0VzBo?=
 =?utf-8?B?aWxrT1h3T3RSWkcwRTNTekZlM3NtQmt2UkxGZ20wdTdmYS81WDd6aml3V2tJ?=
 =?utf-8?B?UWxMY0Z3MWtoWVJwRmVIZmV3ekdTOFNuSlFpN1U5V2dtR1dpVENuUFhXTDQ5?=
 =?utf-8?B?TFBQSTFDTHA4bkJ5UGVRK1kwTlFFUlZnMmtCMnNrcERhTEhrZkFTWUQ2eC9m?=
 =?utf-8?B?REZPM0dFZzBoN0ZnQ0ZIZkxtVGVTQ1IwUWUrRktvb0daQ3ZLUjBDN0RoSzRp?=
 =?utf-8?B?b2gvVzFmZHdVZUx3ZXF5cTlMd3QwK0Frd0JvZ3pqaEtSc1VlZUZDMXVTK2dw?=
 =?utf-8?B?b1FlTlZnYSt4U3p3WGdtRXFwbjNsL2tlck9hUDF2U3NJd2labS8zdWhJVk5t?=
 =?utf-8?B?UHFnTlFLTVI5UlhJZUxETFNPVjZxaEl4TGVkTDNjK0lFam95VU1ES3F1Q0ZS?=
 =?utf-8?B?VktLbTA0REZ5NkQ0MEtEeTh1UFdEMVdHQ0gxRGF5LzlRcldDMGtTajN0cm9S?=
 =?utf-8?B?NUlCZlAxTk9hZDZQMkpKQ1FTQWFEOXM0czd0UjZsUDk0UlhIMXR2N0ZOM0FV?=
 =?utf-8?B?U25TNGJKY1R1VU83T0hPL2hIOSs2empSUEVibFNqTGhTN0R1eDZmNm1VVldV?=
 =?utf-8?B?eHliVGxwSVdOazJrTGl2RE15OVlwUGhFMUQrRHV2ZGI3QWltQ0JiYndRTEo4?=
 =?utf-8?B?ZmdFZjhDVWZaaXdpQWJ2dFdvQW13MWZZbWJqcElmZE1sS0pNaElNbkZqRmJS?=
 =?utf-8?B?clRHVVd0K28rTHN5QnE1azdwMVZPYVliREVXRWJkdGpnTktMaWlqZDVjSHFB?=
 =?utf-8?B?THJoYmUvay81U3diZm9VNG9ZRVJhL05ON3NtSXIva04rT1hCZDBWRW9tbFI0?=
 =?utf-8?B?WG9aSFBxakwxVURZekdOemM4Y1ozNDNNTUErWEduTDJaTnFxamhKZlc4K1BX?=
 =?utf-8?B?OXBlejhwZHZTZ01XZWlHelE2VE1vbDF1WlpZQ2VJTjNUYVpheDhPUUFiT3JG?=
 =?utf-8?B?MlJKL29DcVZLS2FnYkwyR0loVFFqSi8yejR2bXNoeEVybllJd0c2ckM4RFBZ?=
 =?utf-8?B?ZFJoMmFQMHJiL3AxaE15QkwzRW1uOFk1TWVNRDFVT3VyUTgzcE5NU3BzOHBl?=
 =?utf-8?B?YlpUSjY0enZQcmdiMVQ1Zk55ZndUZStpMXgycHpvOW03L1dNVDI4R0t5QU54?=
 =?utf-8?B?dW13ejlpeGtvaXQ2alB0SEIvdlUyMUdUUjg2VnFUb29oU0RMUHMvYVVyb0pM?=
 =?utf-8?B?ZjFlMzhIK09xN3BGTllSWEtWYkFpd2daWTc5bktuTDVVaVJOaVlTRCswdWxs?=
 =?utf-8?B?dS80U05iTGN6U1cvT3Eyc2tkTDlNaG1YNVRGYzYwdER2S1dnS21XY1lKQXVI?=
 =?utf-8?B?Kzd3eE53cGg5OGpHbmNIRlVTcGFVSWNsekd4S2c5azdCU1VXYmRHbDhlb1FE?=
 =?utf-8?B?bTFCUHlXYmpmQ2lNb0QvWHAyT2JSUXdiQ0t3anlsZ0FKRi84YTR5eUpaOEx3?=
 =?utf-8?B?UnpWUld3NjlEdTc3aWRMZjIrdVpMRVNzemdWNENFYzU4NUh1ODhPN2h2bXJY?=
 =?utf-8?B?V0JCYUk0K3ZnMmhIbHdlZ3M4UzRUT0h1UVU3QUZNdmIvTmJqZk5mWUFSL29K?=
 =?utf-8?B?alJmQTdnNDRieTNDdWxTQW5ncGRHR2JXVVdvdjdwVzRNc3NvYkV0eVIwemcr?=
 =?utf-8?B?bXZDVFgxYjBTY2lDQndoTEtqaVJkM1BxS2dIejVXM0M5R1hrMk5meHB0alAr?=
 =?utf-8?B?ZlZqcXkvamR6eWVGNlA0OERnM3ZhQi9xNlArVGordU5wOFBrYThEczFNeXBp?=
 =?utf-8?Q?YAWuNlFrm7fG9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8697.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFZCdUduVEFyVjZqOGl6eVlwVGF6YmZOMDl0aFZuTlllZmY3OTNyWTc1S2hF?=
 =?utf-8?B?KzNvVU9EdU5JaGdxQVJQVFkycmdGRHJ0VDVRUy9NbVB5dFc2Q0pIaHFDcEhm?=
 =?utf-8?B?TmVjcVN6L0Z4SXRlSWRhNG1tSDRRTnBnYkZRYTRnSmVBUnp1K1dGQjcrdTJv?=
 =?utf-8?B?OXpNZllydXBVMmdBUTl2UDhjMVZJUTByc2hQM2pBbmp5Y0FsOU5tS0F3c0da?=
 =?utf-8?B?MVNSL1pqOWVHSTZsTTAxbloxVlRLMEcrVEp6Z1lrd3RVVjk4dUFGR25DQm91?=
 =?utf-8?B?Z1U4b2ZmajBzZlMxYTAxekFQUW5TdHIzYmhyaXhaNWloQzlBQ21QSTkxYzY5?=
 =?utf-8?B?OG9LaVA3aEJOT1BOWWJtV2VBNVZRY1lhdExCZURldjVBaTNpM29lbHNPd25h?=
 =?utf-8?B?S3d0UUU2d2FMelV4R1JMY1NQaWZIMDQ3c2dneHhFdzBjQlVhejVxQ2V6MnVN?=
 =?utf-8?B?WWJKaDBQVEV2RUxCN1lGUS9FQW1YekFUemhMMm84Zlc1NGluQjh5bDdEbGYr?=
 =?utf-8?B?bXJINHNkTmFwYmJvUDNVK3RyamhZL284WEU4RFRzRC82dGtWWlJKQm53djVu?=
 =?utf-8?B?UmdCQ0JIVnJqVXpXWTZCZ2x1bmJBSDNnR1hGNVdjVjc1cGF2Zmt1KzJVYnc1?=
 =?utf-8?B?Y2lUcnduQVVSQjdiWk4xbnczT2dDeWRkOTVSWmdWbXFsK2NqRHpDLzNRQTll?=
 =?utf-8?B?cVBHNy9CYitzNzQwakFmT1hXUGo5L2xMTzh0WUlXb2F5QzdiaS9oUGhaeW1Z?=
 =?utf-8?B?WDVZdEs0MEw5dUYvaUlUa3pHMFpRdDVsR2lYZk5oQklKOC9nMzc5VE5mRTRt?=
 =?utf-8?B?Wm9RWGY4VlZQOGo0d3VkV0Z4YlIxZEFyRElBSENHVHlQeWZTODVDMVFCWXVw?=
 =?utf-8?B?bHR6T3lHRlNZc0twalZhbEsxYThTbFpWZHJBZktFYkN3ZEs1VkpNbklvUndo?=
 =?utf-8?B?aERkaVY1Nmc5RWxJalY2N0QxbzVBODZ4WlZhVUk3WEQwTks0TzJMUlIyVnlR?=
 =?utf-8?B?RkpnM0E0UUo0WGtEeUVoVUN1WmIxTytGS2Ftc2lNREVDU2d4emlOR3FiaCsx?=
 =?utf-8?B?aVQ2K0pCSWtmVTZWc1ExSnUrRkxmZldBRk1vOC9MUUFkK1NsT2thcE81R2hM?=
 =?utf-8?B?Q3hUdlR2eC9TdHdYUHhiV2NDNVVOTlBFMzBNVG5WNmxJeGZ3U1RscHhsOHhO?=
 =?utf-8?B?QVRUeGprRm5vbXVkdnV0eUUycHc4L1N4SHg4cUYzNThUNkN5WUs5ZC95ZTNu?=
 =?utf-8?B?UUNSN2dOejhUbEp4NXVja005dHlEK053WlVxSDF0OThsaENZbmtzZ0kxbjNa?=
 =?utf-8?B?MzNOYU0rL3BnK09mOUxtV0RHc0VvR01MK3E5cjFaemFwWHN4cVorelAyL1o2?=
 =?utf-8?B?elRvNnZaTEIvbi81Q0VuQk9nQWJFaTkvZjBDdTJSNzA2NWpPMzdoWTZtZTA2?=
 =?utf-8?B?NVpuUmFsUStkUENXdzhTZjg0cnZGR01Ud3hkbHpqRU1XY2liSTFaWkVOeGdH?=
 =?utf-8?B?SjRIcGtOcTVCM3FvS3g3L0w3UE1pajFtN0ZTcjROcmpySzJhTXBySkJPZENl?=
 =?utf-8?B?eUhRbjljTDZMUkZsSDlaT2tieWJJY0piNFpyd1ZhanpJR3pIRnRXZ2tLMC81?=
 =?utf-8?B?RWpJVTVZRWhWWFNrRnVQYmQ0alZxYTN3TkxJanNlN1prbjk2TkpzSjE5Mk9W?=
 =?utf-8?B?c04zVzc4aVZ6Wmx2U283U3dWR1JTSTBaVzF0bHR6VlZrUG5ucHR6Y1hpTDJi?=
 =?utf-8?B?S0VqT2xuQ2hzK3NteXRWUjg4Q0tsdE5CMVd0RWxXZGtQSmF5V0pKVEJPM0xX?=
 =?utf-8?B?dnZrMm45QmVXKzQxcVIzbU9ORW5LM09peUNzQmJ3Qm1wcEJERWh0M2g2bmFN?=
 =?utf-8?B?Kzk1QmJZRFZxMENIUWJkTGRqTFZCbVF2bTM1QVR5eTlRbEVKNHc4WSs0eDEw?=
 =?utf-8?B?QlpkOG1LU2ZVUm5EWnhHenREUkY5dGlod0ZaaVhYOGNia1BHdHlaSDBXTEFH?=
 =?utf-8?B?ZHd0TjJQYWd1VHJZdXBmSmhVU1J3Mm83bkdBbUcvdjZPQWJ4eURSVWpiUDRY?=
 =?utf-8?B?c3lWY0tmQ1lIU1BsRkRRNzRScTQvZ2RBMmJqbWtpd2kvZkxWT3VVN1pRa0xU?=
 =?utf-8?Q?6/YE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edae9bf4-d5ad-4aba-2a47-08dcf37047ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 14:37:54.4093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /sm0v+rTGorQ/FNdO3OKDrKjAMjwSCxLW1FCCbkviU1PgBf3L9fAe5ln8huZxlyt3+9r/mjuEcR/9d5NNMOzvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6023
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:40:30 +0000
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWJiYXJhcHUsIFZl
bmthdGVzaA0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMjMsIDIwMjQgNzo1NSBQTQ0KPiBU
bzogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0QG1haWxib3gub3JnPjsgdS1ib290QGxpc3RzLmRl
bnguZGUNCj4gQ2M6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPjsgQXNo
b2sgUmVkZHkgU29tYQ0KPiA8YXNob2sucmVkZHkuc29tYUBhbWQuY29tPjsgSmFnYW4gVGVraSA8
amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ow0KPiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2Vy
bmVsLm9yZz47IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPjsNCj4gUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+OyBQYXRyaWNrIERlbGF1bmF5
DQo+IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPjsgUHJhdHl1c2ggWWFkYXYgPHAueWFk
YXZAdGkuY29tPjsgUXVlbnRpbg0KPiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT47
IFNlYW4gQW5kZXJzb24gPHNlYW5nYTJAZ21haWwuY29tPjsNCj4gU2ltb24gR2xhc3MgPHNqZ0Bj
aHJvbWl1bS5vcmc+OyBUYWthaGlybyBLdXdhbm8NCj4gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVv
bi5jb20+OyBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPjsgVHVkb3INCj4gQW1iYXJ1cyA8
dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPjsgdWJvb3Qtc3RtMzJAc3QtbWQtDQo+IG1haWxtYW4u
c3Rvcm1yZXBseS5jb20NCj4gU3ViamVjdDogUkU6IFtQQVRDSCAxLzZdIFJldmVydCAic3BpOiB6
eW5xX3FzcGk6IEFkZCBwYXJhbGxlbCBtZW1vcmllcyBzdXBwb3J0IGluDQo+IFFTUEkgZHJpdmVy
Ig0KPiANCj4gSGksDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJv
bTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0QG1haWxib3gub3JnPg0KPiA+IFNlbnQ6IFdlZG5l
c2RheSwgT2N0b2JlciAyMywgMjAyNCA3OjQ5IFBNDQo+ID4gVG86IEFiYmFyYXB1LCBWZW5rYXRl
c2ggPHZlbmthdGVzaC5hYmJhcmFwdUBhbWQuY29tPjsNCj4gPiB1LWJvb3RAbGlzdHMuZGVueC5k
ZQ0KPiA+IENjOiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT47IEFzaG9r
IFJlZGR5IFNvbWENCj4gPiA8YXNob2sucmVkZHkuc29tYUBhbWQuY29tPjsgSmFnYW4gVGVraSA8
amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ow0KPiA+IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBr
ZXJuZWwub3JnPjsgU2ltZWssIE1pY2hhbA0KPiA+IDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IFBh
dHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPjsNCj4gPiBQYXRyaWNr
IERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPjsgUHJhdHl1c2ggWWFkYXYN
Cj4gPiA8cC55YWRhdkB0aS5jb20+OyBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAY2hl
cnJ5LmRlPjsgU2Vhbg0KPiA+IEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT47IFNpbW9uIEds
YXNzIDxzamdAY2hyb21pdW0ub3JnPjsgVGFrYWhpcm8NCj4gPiBLdXdhbm8gPFRha2FoaXJvLkt1
d2Fub0BpbmZpbmVvbi5jb20+OyBUb20gUmluaSA8dHJpbmlAa29uc3Vsa28uY29tPjsNCj4gPiBU
dWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+OyB1Ym9vdC1zdG0zMkBzdC1t
ZC0NCj4gPiBtYWlsbWFuLnN0b3JtcmVwbHkuY29tDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAx
LzZdIFJldmVydCAic3BpOiB6eW5xX3FzcGk6IEFkZCBwYXJhbGxlbCBtZW1vcmllcw0KPiA+IHN1
cHBvcnQgaW4gUVNQSSBkcml2ZXIiDQo+ID4NCj4gPiBPbiAxMC8yMy8yNCA0OjE0IFBNLCBBYmJh
cmFwdSwgVmVua2F0ZXNoIHdyb3RlOg0KPiA+ID4gSGksDQo+ID4gPg0KPiA+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0
QG1haWxib3gub3JnPg0KPiA+ID4+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMywgMjAyNCA2
OjE1IFBNDQo+ID4gPj4gVG86IEFiYmFyYXB1LCBWZW5rYXRlc2ggPHZlbmthdGVzaC5hYmJhcmFw
dUBhbWQuY29tPjsNCj4gPiA+PiB1LWJvb3RAbGlzdHMuZGVueC5kZQ0KPiA+ID4+IENjOiBBbmRy
ZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT47IEFzaG9rIFJlZGR5IFNvbWENCj4g
PiA+PiA8YXNob2sucmVkZHkuc29tYUBhbWQuY29tPjsgSmFnYW4gVGVraQ0KPiA+ID4+IDxqYWdh
bkBhbWFydWxhc29sdXRpb25zLmNvbT47IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3Jn
PjsNCj4gPiA+PiBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IFBhdHJpY2Ug
Q2hvdGFyZA0KPiA+ID4+IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+OyBQYXRyaWNrIERl
bGF1bmF5DQo+ID4gPj4gPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+OyBQcmF0eXVzaCBZ
YWRhdiA8cC55YWRhdkB0aS5jb20+Ow0KPiA+ID4+IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNj
aHVsekBjaGVycnkuZGU+OyBTZWFuIEFuZGVyc29uDQo+ID4gPj4gPHNlYW5nYTJAZ21haWwuY29t
PjsgU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+OyBUYWthaGlybw0KPiA+ID4+IEt1d2Fu
byA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT47IFRvbSBSaW5pDQo+ID4gPj4gPHRyaW5p
QGtvbnN1bGtvLmNvbT47IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz47
DQo+ID4gPj4gdWJvb3Qtc3RtMzJAc3QtbWQtIG1haWxtYW4uc3Rvcm1yZXBseS5jb20NCj4gPiA+
PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNl0gUmV2ZXJ0ICJzcGk6IHp5bnFfcXNwaTogQWRkIHBh
cmFsbGVsDQo+ID4gPj4gbWVtb3JpZXMgc3VwcG9ydCBpbiBRU1BJIGRyaXZlciINCj4gPiA+Pg0K
PiA+ID4+IE9uIDEwLzIzLzI0IDExOjA3IEFNLCBBYmJhcmFwdSwgVmVua2F0ZXNoIHdyb3RlOg0K
PiA+ID4+PiBIaSwNCj4gPiA+Pj4gVGVzdGVkIHdpdGggdGhlIG5vbi1zdGFja2VkIGRlZmF1bHQg
c2luZ2xlIGNvbmZpZ3VyYXRpb24gb24gWnlucU1QDQo+ID4gPj4+IHpjdTEwMiBib2FyZA0KPiA+
ID4+IGFuZCBkaWRu4oCZdCBzZWUgYW55IGlzc3VlLg0KPiA+ID4+Pg0KPiA+ID4+PiBaeW5xTVA+
IHNmIHByb2JlIDAgMCAwDQo+ID4gPj4+IFNGOiBEZXRlY3RlZCBtdDI1cXU1MTJhIHdpdGggcGFn
ZSBzaXplIDI1NiBCeXRlcywgZXJhc2Ugc2l6ZSA2NA0KPiA+ID4+PiBLaUIsIHRvdGFsIDY0IE1p
Qg0KPiA+ID4+PiBaeW5xTVA+IHNmIGVyYXNlIDB4MCAweDQwMDAwMDA7bXcuYiAweDgwMDAgYWFi
YmNjZGQgMHg0MDAwMDAwO3NmDQo+ID4gPj4+IFp5bnFNUD4gd3JpdGUNCj4gPiA+Pj4gWnlucU1Q
PiAweDgwMDAgMHgwIDB4NDAwMDAwMDttdy5iIDB4ODAwODAwMCAweDAgMHg0MDAwMDAwO3NmIHJl
YWQNCj4gPiA+Pj4gWnlucU1QPiAweDgwMDgwMDAgMHgwIDB4NDAwMDAwMDtjbXAuYiAweDgwMDAg
MHg4MDA4MDAwIDB4NDAwMDAwMA0KPiA+ID4+PiBTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgRXJh
c2VkOiBPSyBkZXZpY2UgMCB3aG9sZSBjaGlwDQo+ID4gPj4+IFNGOiA2NzEwODg2NCBieXRlcyBA
IDB4MCBXcml0dGVuOiBPSyBkZXZpY2UgMCB3aG9sZSBjaGlwDQo+ID4gPj4+IFNGOiA2NzEwODg2
NCBieXRlcyBAIDB4MCBSZWFkOiBPSw0KPiA+ID4+PiBUb3RhbCBvZiA2NzEwODg2NCBieXRlKHMp
IHdlcmUgdGhlIHNhbWUNCj4gPiA+Pj4NCj4gPiA+Pj4gVGhhbmtzDQo+ID4gPj4+IFZlbmthdGVz
aA0KPiA+ID4+Pg0KPiA+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+Pj4+
IEZyb206IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBtYWlsYm94Lm9yZz4NCj4gPiA+Pj4+IFNl
bnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMywgMjAyNCAyOjEyIFBNDQo+ID4gPj4+PiBUbzogQWJi
YXJhcHUsIFZlbmthdGVzaCA8dmVua2F0ZXNoLmFiYmFyYXB1QGFtZC5jb20+OyBNYXJlayBWYXN1
dA0KPiA+ID4+Pj4gPG1hcmVrLnZhc3V0K3JlbmVzYXNAbWFpbGJveC5vcmc+OyB1LWJvb3RAbGlz
dHMuZGVueC5kZQ0KPiA+ID4+Pj4gQ2M6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBh
cm0uY29tPjsgQXNob2sgUmVkZHkgU29tYQ0KPiA+ID4+Pj4gPGFzaG9rLnJlZGR5LnNvbWFAYW1k
LmNvbT47IEphZ2FuIFRla2kNCj4gPiA+Pj4+IDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT47
IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPjsNCj4gPiA+Pj4+IFNpbWVrLCBNaWNo
YWwgPG1pY2hhbC5zaW1la0BhbWQuY29tPjsgUGF0cmljZSBDaG90YXJkDQo+ID4gPj4+PiA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPjsgUGF0cmljayBEZWxhdW5heQ0KPiA+ID4+Pj4gPHBh
dHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+OyBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5j
b20+Ow0KPiA+ID4+Pj4gUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT47
IFNlYW4gQW5kZXJzb24NCj4gPiA+Pj4+IDxzZWFuZ2EyQGdtYWlsLmNvbT47IFNpbW9uIEdsYXNz
IDxzamdAY2hyb21pdW0ub3JnPjsgVGFrYWhpcm8NCj4gPiA+Pj4+IEt1d2FubyA8VGFrYWhpcm8u
S3V3YW5vQGluZmluZW9uLmNvbT47IFRvbSBSaW5pDQo+ID4gPj4+PiA8dHJpbmlAa29uc3Vsa28u
Y29tPjsgVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPjsNCj4gPiA+Pj4+
IHVib290LXN0bTMyQHN0LW1kLSBtYWlsbWFuLnN0b3JtcmVwbHkuY29tDQo+ID4gPj4+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIDEvNl0gUmV2ZXJ0ICJzcGk6IHp5bnFfcXNwaTogQWRkIHBhcmFsbGVs
DQo+ID4gPj4+PiBtZW1vcmllcyBzdXBwb3J0IGluIFFTUEkgZHJpdmVyIg0KPiA+ID4+Pj4NCj4g
PiA+Pj4+IE9uIDEwLzIzLzI0IDU6MTggQU0sIEFiYmFyYXB1LCBWZW5rYXRlc2ggd3JvdGU6DQo+
ID4gPj4+Pj4gSGkgTWFyZWssDQo+ID4gPj4+Pj4gVGhlcmUgd2FzIHNvbWUgaXNzdWUgYW5kIGZp
eCBpcyBzZW50DQo+ID4gPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIwMjQx
MDE4MDgyNjQ0LjIyNDk1LTEtdmVua2F0ZXNoLg0KPiA+ID4+Pj4+IGFiDQo+ID4gPj4+Pj4gYmEN
Cj4gPiA+Pj4+PiByYQ0KPiA+ID4+Pj4+IHB1QGFtZC5jb20vVC8jdQ0KPiA+ID4+Pj4NCj4gPiA+
Pj4+IElzIHRoaXMgb25lIGZpeCBvciB0aHJlZSBmaXhlcyBmb3IgdGhyZWUgZGlmZmVyZW50IGlz
c3VlcyA/DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gVGhpcyBzZWVtcyB0byBmaXggUkVBRCBlcnJvcnMs
IHdoaWNoIGlzIGFwcGFyZW50bHkgYW5vdGhlciBlcnJvcg0KPiA+ID4+Pj4gaW50cm9kdWNlZCBi
eSB0aGlzIHN0dWZmLiBJbiBteSBjYXNlLCBwbGFpbiBhbmQgc2ltcGx5ICdzZiBwcm9iZQ0KPiA+
ID4+Pj4gOyBzZiB1cGRhdGUnIGNvbWJpbmF0aW9uIHdpdGggc2luZ2xlIG5vbi0gc3RhY2tlZCBT
UEkgTk9SIGRvZXMNCj4gPiA+Pj4+IG5vdCB3b3JrLiBXYXMgc3VjaA0KPiA+ID4+IGEgc2ltcGxl
IGNvbmZpZ3VyYXRpb24gZXZlciB0ZXN0ZWQgPw0KPiA+ID4+Pj4NCj4gPiA+Pj4+PiBOb3Qgc3Vy
ZSB3ZSBuZWVkIHRvIHJldmVydCB3aG9sZSBwYXJhbGxlbC9zdGFja2VkIHN1cHBvcnQ/DQo+ID4g
Pj4+PiBQbGVhc2Ugc3RvcCB0b3AtcG9zdGluZy4NCj4gPiA+Pg0KPiA+ID4+IFlvdSByYW4gY29t
cGxldGVseSBkaWZmZXJlbnQgdGVzdCBvbiBjb21wbGV0ZWx5IGRpZmZlcmVudCBjaGlwLg0KPiA+
ID4+DQo+ID4gPj4gU3RvcCB0b3AgcG9zdGluZy4NCj4gPiA+DQo+ID4gPiBTb3JyeSBmb3IgdG9w
IHBvc3RpbmcNCj4gPiA+DQo+ID4gPiBXaWxsIHRyeSB0byBnZXQgdGhlIHNwYW5zaW9uIGZsYXNo
IHBhcnQgYW5kIHRyeSB0aGUgYmVsb3cgdGVzdHMuDQo+ID4gPiBBdCB0aGlzIHBvaW50IHRyaWVk
IHRlc3Rpbmcgb24gZGlmZmVyZW50IGJvYXJkIHdpdGggZGlmZmVyZW50IGZsYXNoIHBhcnQuDQo+
ID4gPg0KPiA+ID4gWnlucT4gc2YgcHJvYmUgMCAwIDANCj4gPiA+IFNGOiBEZXRlY3RlZCBteDY2
bDFnNDVnIHdpdGggcGFnZSBzaXplIDI1NiBCeXRlcywgZXJhc2Ugc2l6ZSA2NCBLaUIsDQo+ID4g
PiB0b3RhbCAxMjggTWlCDQo+ID4gPiBaeW5xPiBzZiB1cGRhdGUgMHg0MDAwMDAwIDAgMHgxNjAw
MDANCj4gPiA+IGRldmljZSAwIG9mZnNldCAweDAsIHNpemUgMHgxNjAwMDANCj4gPiA+IDE0NDE3
OTIgYnl0ZXMgd3JpdHRlbiwgMCBieXRlcyBza2lwcGVkIGluIDUuNzM1cywgc3BlZWQgMjU3NDM1
IEIvcw0KPiA+ID4NCj4gPiA+IFp5bnE+IHNmIGVyYXNlIDB4MCAweDQwMDAwMDA7bXcuYiAweDgw
MDAgYWFiYmNjZGQgMHg0MDAwMDAwO3NmIHdyaXRlDQo+ID4gPiBaeW5xPiAweDgwMDAgMHgwIDB4
NDAwMDAwMDttdy5iIDB4ODAwODAwMCAweDAgMHg0MDAwMDAwO3NmIHJlYWQNCj4gPiA+IFp5bnE+
IDB4ODAwODAwMCAweDAgMHg0MDAwMDAwO2NtcC5iIDB4ODAwMCAweDgwMDgwMDAgMHg0MDAwMDAw
DQo+ID4gPiBTRjogNjcxMDg4NjQgYnl0ZXMgQCAweDAgRXJhc2VkOiBPSw0KPiA+ID4gZGV2aWNl
IDAgb2Zmc2V0IDB4MCwgc2l6ZSAweDQwMDAwMDANCj4gPiA+IFNGOiA2NzEwODg2NCBieXRlcyBA
IDB4MCBXcml0dGVuOiBPSyBkZXZpY2UgMCBvZmZzZXQgMHgwLCBzaXplDQo+ID4gPiAweDQwMDAw
MDANCj4gPiA+IFNGOiA2NzEwODg2NCBieXRlcyBAIDB4MCBSZWFkOiBPSw0KPiA+ID4gVG90YWwg
b2YgNjcxMDg4NjQgYnl0ZShzKSB3ZXJlIHRoZSBzYW1lDQo+ID4gQ29tbWl0IG1lc3NhZ2UgcmVh
ZHM6DQo+ID4NCj4gPiAiDQo+ID4gdGhpcyBubyBsb25nZXIgd29ya3M6DQo+ID4NCj4gPiA9PiBz
ZiBwcm9iZSAmJiBzZiB1cGRhdGUgMHg1MDAwMDAwMCAwIDB4MTYwMDAwDQo+ID4gU0Y6IERldGVj
dGVkIHMyNWZzNTEycyB3aXRoIHBhZ2Ugc2l6ZSAyNTYgQnl0ZXMsIGVyYXNlIHNpemUgMjU2IEtp
QiwNCj4gPiB0b3RhbCA2NCBNaUIgZGV2aWNlIDAgb2Zmc2V0IDB4MCwgc2l6ZSAweDE2MDAwMCBT
UEkgZmxhc2ggZmFpbGVkIGluIHJlYWQgc3RlcCAiDQo+ID4NCj4gPiBZb3UgcmFuIGNvbXBsZXRl
bHkgZGlmZmVyZW50IHRlc3Qgb24gY29tcGxldGVseSBkaWZmZXJlbnQgY2hpcC4NCj4gPg0KPiA+
IFRoZSB0ZXN0IGlzICJzZiBwcm9iZSAmJiBzZiB1cGRhdGUgMHg1MDAwMDAwMCAwIDB4MTYwMDAw
IiAsIGRpZCB5b3UNCj4gPiBldmVyIHRlc3QgInNmIHVwZGF0ZSIgPw0KPiANCj4gVHJpZWQgdGhl
IHRlc3QgIiBzZiBwcm9iZSAmJiBzZiB1cGRhdGUgMHg0MDAwMDAwIDAgMHgxNjAwMDAiDQo+IA0K
PiBaeW5xPiBzZiBwcm9iZSAmJiBzZiB1cGRhdGUgMHg0MDAwMDAwIDAgMHgxNjAwMDANCj4gU0Y6
IERldGVjdGVkIG14NjZsMWc0NWcgd2l0aCBwYWdlIHNpemUgMjU2IEJ5dGVzLCBlcmFzZSBzaXpl
IDY0IEtpQiwgdG90YWwgMTI4DQo+IE1pQiBkZXZpY2UgMCBvZmZzZXQgMHgwLCBzaXplIDB4MTYw
MDAwDQo+IDAgYnl0ZXMgd3JpdHRlbiwgMTQ0MTc5MiBieXRlcyBza2lwcGVkIGluIDAuMTU0cywg
c3BlZWQgOTU4Njk4MCBCL3MNCj4gWnlucT4NCj4gDQo+IA0KDQpHb3QgdGhlIGJvYXJkIHdpdGgg
c3BhbnNpb24gZmxhc2ggcGFydCwgdHJpZWQgYmVsb3cgY29tbWFuZHMNCg0KWnlucT4gc2YgcHJv
YmUgJiYgc2YgdXBkYXRlIDB4NDAwMDAwMCAwIDB4MTYwMDAwDQpTRjogRGV0ZWN0ZWQgczI1Zmw1
MTJzIHdpdGggcGFnZSBzaXplIDI1NiBCeXRlcywgZXJhc2Ugc2l6ZSAyNTYgS2lCLCB0b3RhbCA2
NCBNaUINCmRldmljZSAwIG9mZnNldCAweDAsIHNpemUgMHgxNjAwMDANCjE0NDE3OTIgYnl0ZXMg
d3JpdHRlbiwgMCBieXRlcyBza2lwcGVkIGluIDUuMTg2cywgc3BlZWQgMjg0Njg4IEIvcw0KWnlu
cT4NCg0KDQpUaGFua3MNClZlbmthdGVzaA0KPiBUaGFua3MNCj4gVmVua2F0ZXNoDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
