Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FECA4720
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:20:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17B14C628D3;
	Thu,  4 Dec 2025 16:20:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6BC2C628D0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2n0CGVVfC5Qt196mZVw2dIkQI03ICQDJXPnW8TYkBd9iGR7f3Dpq8FowpwcsAhjDSI1Bh2LtVHjGeYnRP1pkh39lYHyUdz0DpMw7iiVIc27DvBOnKTpeM7sRitVcUud3D1ydRl5LpSKk8RKgP84c0W2mIbHxPdhKAHXt86pUE71mhJXIOWWpgQu3JtNwtfaeJThLXbinWoyZwHW/KSmhOLw+V+dln+sBCDiA9Vxg76cCK43e+x94YJcHCZ729sLdvRiyNTOXPEpb7CFtbB/J+ldoy1tykeDlx2ySbr6IIudir86J9aXye6IvbU625FQ1R2mMlSdw5C2YLWo3aNUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=Zrfrn2cQgFY5K02IJglTMJ2IwSj66GskWGP424VjbuYL8dL5HlYLuk76fsJFPkObnV/hUi2xg4zwPvB8Tvm4p5FZ1I9zqCxHoHSKJPyEQhCOxrbwWhgvte59P/XmcgHZuZrxyMqbiNURDvWra1ZpMwJttLSL88Kc+qfjpOqtK8TR2+oLugM8j5joxygMdjYEu0Nhb/gICA2ydN7lpYIzIB+clDh/teYP7zwFVJjs+3+qJone9EAx9GncczzyY6b3MbzQSwBqm0j+Q2UZLbDt+/zAf74xgAu1HZagFhcpqdWKMwbmz3lkTeaEoRRaH2I0sndaby40ZJ+JUF9E25JBRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXFGxh0rMBG5R5RRBgr18z9rkaRqfUNK/RmWUk+7cEc=;
 b=e4IBMeA8CSlBSF66dKQeHO66sjjFdQyni/yb/i+GivfJq+aicr7kAq3j+O3/5C87lM3QuUwi6Dk5IwnypkBDE19HuMMbTFLvKHedQ27+lpNnS2fGPPopIRMVjnmrLOADuJwMe6YfyGQEq00GfYqonOX5u77sP9r3FtEv5kED0kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB11059.eurprd04.prod.outlook.com (2603:10a6:102:485::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 16:20:38 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:20:38 +0000
Message-ID: <26febe00-38aa-4a2c-b658-4e7c6538602e@cherry.de>
Date: Thu, 4 Dec 2025 17:20:36 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-16-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-16-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR4P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::9) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB11059:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a791567-d2a7-4e3c-1e2c-08de33510f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OW5DMG9aOElJWGRqQUdOVVFST2JibHZSU2NSaml5L1JPN0cyUGFnbWdDVXZv?=
 =?utf-8?B?MUJWcWI0NlF6YWdSMnY1Q2VDN1BzMkJyTUF2ZzdLd2hpUm12d0pJd2J6Nnd3?=
 =?utf-8?B?OUsyZzFuUkh0NjZwQVROMGxMUVJ0YkZvSTJEMWViODROZFdtMjRCSXV4eGVS?=
 =?utf-8?B?NlVsVjZuNzF3ZzNFQmtKTmtUbms3N2ZBK3B5RUd6M1ZaRXVrekhWb1BpV1JX?=
 =?utf-8?B?ckhzS3dJWURqRW5mQnhtQmhSb2Z1enIwdi9yR1dzQUtsMzlBNXNRZGg1Nmo1?=
 =?utf-8?B?Q0dNWjc4di9uRFNSaU9VUDQ0TG8yanVBUWJSdVY4V3hhMkNpOEN5L1hCQVpu?=
 =?utf-8?B?ZXRFaW1uM1AwYVlEMElrNVRWQ0dZeDVBS1hmM3pUbTNqYzlCaFZ3SzFYVEVC?=
 =?utf-8?B?aUNhVVU1dXpxY0ZqbmVBaGlBVUl3bVVmL3poRVUvNUdRZC9ScjNXcUdoRWY1?=
 =?utf-8?B?bTkvTlIvV2YyNlNVd3BTa3dDVW8wQzNqeHU4RE4yaFE1bzAyWDdLU2R5Tmtx?=
 =?utf-8?B?V0w2YTVtQmhKclRTNE43RFFTeFV2RVJ0VWROUkpkUVBpSjZmZHQwcUNySVU4?=
 =?utf-8?B?enE3NDVJenVTajVSaE45Mlh2Y0E3SEJnYVlSaSt5TDVKeVkvaDAvUiszUnRH?=
 =?utf-8?B?RGRyR1VnWXU0UGhBVTF5ODFMOE96YUNDRkxyU2V0NDJ5M2dLaHp2NmJRV285?=
 =?utf-8?B?Y0ZzbjUxWjFid3d1bFdmZ2cwRzdSVmdmQXcySjMxNXVDNHZydmkwMzVVU2Vr?=
 =?utf-8?B?amd0bXRFNjVnajdGZHVWZG84M291NHEzc1l0eU0vZU9NaEw1VnpkTUphWWtH?=
 =?utf-8?B?S252TmlQb255OVd3Ry9Yd3VBOEY0aSt5MENBVnZoeldLQnF5dEc4UFlLZ3JG?=
 =?utf-8?B?R096YU9GdEtodmFJbW0vNmdWaWk4K0k3Y213SDRHdzZBUFJ2WlVZVWc5cGNx?=
 =?utf-8?B?c0d4UGxIUEVJcVUvblZ1eDBpamlNYXl3NXRkTHlteDNOWVZTVHI3cG1NMVA4?=
 =?utf-8?B?OElXR2U0SVBnR0ZsWDNiUnZ3L1dadnRreG0xc0U3cXFRME5wU1hhSXFUTmdG?=
 =?utf-8?B?dTFFbGZzWGxuYzUrYmxMcCtzQStJcjMyeU1seCtZL2hWU3JxQ1pIb2VyOEs4?=
 =?utf-8?B?Rmd1eXlLNDRLTlZKMzVuSFQxOGN6bExBdjNRRU5QTklIYXhvM3Ixd3lqUXA4?=
 =?utf-8?B?TXNPVjBRbmE0TXA1UTdSbDVobUVFZmduZ0o4SEhGdVpwL2pkUXl4aUtZZE43?=
 =?utf-8?B?KzhKWUlhMnJSV0dmcGJuSDQrRGZ1VllmVUNGYTUrdVNveEhxWG01QnlZcTQ2?=
 =?utf-8?B?UUt1QjFIWm44MFd5dnU5SVVncXZSUGt6OUFNcFBmWlNHdm1LbmdaRUlhNUFH?=
 =?utf-8?B?aXIwNDViaDd2a3dRRk05Z05wQ01LYjNTSE5vQS9kMjVwbUs2QkJIcVlRYVNH?=
 =?utf-8?B?YmZvRHhJSEYzbTZoRno0OWVmWlBVRkJnRlBOV2MwTkR5WjlaajZBMTB2UDZi?=
 =?utf-8?B?b0xQNUJSSEZ3bUVPdnpJYzhpYjJlMVZVdDhxVGc3bkZvOHV3Z08yZUFOQy9i?=
 =?utf-8?B?ejRXQ25zSHhrS1NqQ3loZEF6VWFvM25wRlFQZXpBcU4ySmphK0lYaFFva0du?=
 =?utf-8?B?VHl2VHA0d01DZ1JzUEREVmNVem4wT3JtREVQRHVGckl0aFFqQkhnT0I2YmMy?=
 =?utf-8?B?blVUVmVsaEI0NGlkalNSTkc4dlZva1BLUkZOSk5tOE1tMXZXM2EwWTROOFJM?=
 =?utf-8?B?TytRdHlCbGZVN1N0L0ZlQktyNzdVT0VLajV2b3kxYm1BZkpmdFJqc05TZUh2?=
 =?utf-8?B?YmtzTGo4cmN1V2lDeUZtYXZVQmhOY3B4bXhya05QbWx3WjVSTXloblRNZVI2?=
 =?utf-8?B?cjdJbzBabFRVYklaQk43YlBCVVlYQnoybTAxREUxdnBTSjNlWnNMbkVyR09U?=
 =?utf-8?Q?Di/uiSOC2/HTkHBveqex96lt57KEfxrX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFltejJpUVlzZHVFVW9wMDhJeXB1MGpIRWgzOFIyS09HWnA0Mk9nTHQrRmlo?=
 =?utf-8?B?SmVUd204bUZ3MzdZSE1NYjN3MWc2Wk0yeVZDSUNkY0tCZXpxM0xtZnJFTFRo?=
 =?utf-8?B?YWxzZ0NDTDRCWDQzMUFoZnZtdWpDMGtzTTV0blBxUlhIOVRNOTdienhsTm1E?=
 =?utf-8?B?SDlaVVZGenFaR3FPcEI0N0NOUXhYYS94dXNqd0ZkazJ5OEs3QmRQVzNCek42?=
 =?utf-8?B?RjIvZlp0NUl1N2tVaHdLaWVSVWhVWWRCQUxlc0hGcjF4aS9kbjlJSVUwekNG?=
 =?utf-8?B?S24ya3VlK05HZ3Z5YmY3MmZwTmZZb0N1R2N3QldjOVB3Q3MyU3dxa1ltNTVB?=
 =?utf-8?B?MmxreFVOZUIvRUhYRHgzeXU4dldON1hldUZhN2MyVjVIUzVnbk05TkJSMWZw?=
 =?utf-8?B?ZE5hWUZtbWlvWlZnWHJEc254NnlMVVlSVHROTS9HSU9TaFF3c3FFNHIyaFRO?=
 =?utf-8?B?UDB1NW84dnhLK3JoZW4vMndrQUY1MUtBZ2MwM2JZR3h3aUVjOWZHaHdGWUlN?=
 =?utf-8?B?QTZJVkdWRGk4REN6bVF6SWtPaURKWGxjRWt0NkhzNUUyZ2p3ZjRhR3VCSk5m?=
 =?utf-8?B?R1llZkx2UlZwZ0x0VTdzc3ZRODZxSC9Qdzk0dVRacXJaMFdjbFlrM1ZPTGwx?=
 =?utf-8?B?cE5tU2V3aWlaRG0zMktac0YvbEN1ZDFMeEFBUW1sV3Y5bUNLS1hrMW40emdv?=
 =?utf-8?B?RlNtbkcwaEd6S0VyYlg2a1dQNzdjZjFYT1RoYVh0TUgwQ0pBSXI1OW1seGI5?=
 =?utf-8?B?STU0SkQ0czJ0MWt3dnpMbVpEQlc0RUpRQTJyZjhtWUQ1bkNMUXdYTDh0TnV6?=
 =?utf-8?B?VWhoUkszMXc1Y05zamVmRDhtVG5FMmcxWFEvY3d1QnhDRk5UZmhRTUxZWjZ1?=
 =?utf-8?B?Sm5TMkdhMUdEdEhZUGFzWncvak1XMXJBcE5JV1JtSDIyb2xsbmpCYUY3Yzdp?=
 =?utf-8?B?d1h0OWo1eUd0RFVTd212MzBvS3VmQy9SQ1FEQXhKZGJiZCs2bndScldBeVZY?=
 =?utf-8?B?MlZRdkJpc0ozZHRBcTFOdGlMc1p3aVRnQjhlVFdCUHBqU3JoYVNyRXBwaFFw?=
 =?utf-8?B?YitvWFZ6akh3aXowY1RSNkFaWTRqYVcwSHdJZHJ6d3VTQ0JLbm1vVDIydE5v?=
 =?utf-8?B?UkpmekxrNVNpWmxxaTRyK3k2cjQ5QkhrT3dZb1NqMkhWYUlRWnFoZFVRNHZG?=
 =?utf-8?B?Nnp4UEV6cUN1Z3M2RU9Dc0hvSFd2MnBhQkxZOGFXVkZDb21ybDBCSEpqOGF1?=
 =?utf-8?B?bEJ5NWNOQlhNRjJJWGllZnZmT3VGcnYzZlIyOXYwNVN4dXNnbHJSbVZOL1do?=
 =?utf-8?B?Ykl1Y2lqWUJPbVBGZFBaREtOMWZvUGxmNDM4aDJtYWZzUjJHMVJwdGUwZ1FK?=
 =?utf-8?B?ME1abUMveTAvMXBEbTlMS2ZXc3ZDRFJDcHVkdnFjbkR1OGJvWVNkN05jM2Yx?=
 =?utf-8?B?eXRMeFp4amd0STZLVElyL1hVeS9tRUJDTFNnRUdpUFZnTURsWExmdEN1Szh6?=
 =?utf-8?B?dWR0TXZHdFZrQW1GOGc0eFhHZHcwNXFRandIQnA3NTh4ZDc0bDRsY1NzMDFy?=
 =?utf-8?B?R2YvWUhWRW1IMEZjSDNsQkcvVVcxYjRCSlJ0VGZpNnlvZ1hUVlFROWlrTjJG?=
 =?utf-8?B?ODBwdkZyZXU4Ni8vdW5qWVdVYjY2OVI0UE9wMExXYnZuTWplcy9YMXpNcGNI?=
 =?utf-8?B?aTV2UlZoM1lwVVozenRXNDczTGdzRzZDanNwWkFYWDNmK1UrVm94UmJWNU9o?=
 =?utf-8?B?WnFYeHFTOGFkZEJWdW5nS2xiZDM1Qm5iMk8xWVdEVlBaa0ZYSmd4MnJvc2R0?=
 =?utf-8?B?SUtJL2ZEbHdlNE5UcnJwUVREZGtaUDlxbkoxRlVlQ0J0WE1Od0xuNEZ2dHNv?=
 =?utf-8?B?TnVBdlhsLzk3cEpiS1JsSkxEZXIzRzZFR0VRLzE5UkRyckhyQjdYWWFVMW1Z?=
 =?utf-8?B?U0RhdW01Y2Q1cW4wVVV1TnhpZ3RLcXZ6UytFUTVNa2dsV1pQN3F0SVREV2da?=
 =?utf-8?B?NDhxcnk1cks0Tk91T2p2cWVGT2Y3ZC9YbmY4WWtSeFJKME9IZmdRNVpoTjV3?=
 =?utf-8?B?MEpLc0lMOHNxYW4yZ3l5NEpLWS9iTWhiWFZWUGR1V2FRZ2l4amVLaVQvQWNo?=
 =?utf-8?B?U2kwZVpXZEtBaC9kSG9mOHNOdkYxSzk2L2d2QlFIU3h6b0hkYU5hMTBzd295?=
 =?utf-8?Q?zzN+hllMzOPZBT+g91V6ZTk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a791567-d2a7-4e3c-1e2c-08de33510f78
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:20:37.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCYfpRvqc09Nk1I7Zp8pl3cJBJzlgSJK86CcjCWeLgHaZJToYyQHfVWpT08kZwiG4JbfgNGitF6VHFRvVQQ6EDgv+Ngdr0iSGtEHPqBlhXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11059
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 15/23] configs: stm32mp2: Enable LED_BOOT
 for stm32mp25_defconfig
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

Hi Patrice,

On 11/14/25 5:23 PM, Patrice Chotard wrote:
> Enable LED_BOOT to use led_boot_on/off() API in board file.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
