Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B75CCA47AD
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 17:27:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1BE8C628D0;
	Thu,  4 Dec 2025 16:27:20 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013016.outbound.protection.outlook.com
 [40.107.162.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 219E9C628CF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 16:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwWvW62wgvIPVAMBthYPuqAInZPe4q+MSkm1dnufZjZsg7eVXDvSMnciXpMwBjf3akeyGg8wMHzX+bT9qKUmuQvvGeqreG9ZMukXcXa0H0IP7zgNPzR2X47jisZUt65DA1iSv/a3Rs41rzfa9fV4F9GiFBDQJqb9O/bLPRQsdQ4Xf2TpuRlQSBOahnIT5gxzVi3Bg7JMOX0NwA0xMG8pgzIOYnrAhJbUsBReIFVTC4xYnFqowJe/K3Wcdu9qWaFjZTRlmUeHYa0N0Ykgk/9ALrpLyavURmgXPCr8cFaojdwVfnUxP4v7DOWe9+a99Y03Sulsq43b2qu7cfb3wy+CWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjsARAPXWqkZ+C2vHnqLhGckxkdvpvAPPYrxvRbpu7g=;
 b=I26zclsS/K6NGzLBBHvxWoiXu+J+69/HosT9+dnMuuvazq5EQCkVEUKHPOnaldEES3NDkTnBf9GKRC4V4Hg2BjiYrftJGdrAmkBnMpKWqjFq12kMUt1dn3/zVWiNC5D6N/1XLlHzIixALYdmznE81o0/mHlCAtdXpI/FcTJlAsjBCJsaUp78H79Ig6ELFqj9JyDPEpTiOPJCnWaTILO/jxmwTjsFkMTjvWAKjP1GVtLVCsBdCc20IDhACH3Te2B/VZM6k3/5vnNwNc89FcCjKpvpA3QBhorXvL1v64L/2fdez1m/0HLW+VP/2Xn+xe86fwAdnSg+JeKJbjvoUpwQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjsARAPXWqkZ+C2vHnqLhGckxkdvpvAPPYrxvRbpu7g=;
 b=WsWDAMrDPfbaTwPgyj/Wr/KHChvZXuHOphwjU8Aw6WmnzE4LG3cz2CYrJbJXZJtYuJJhCIoO/3c5EE+XkDDHfDAM68u2ZoIhk2GbMpSC/aHbI0Q/vrq+TgxP91G+jJt2a8/QDQnQbglY8ZvDZ0ICN96fPhpnW7FAmKuvrnsme4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:27:18 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 16:27:18 +0000
Message-ID: <2a6ec4b2-fb9b-4679-8aac-a5a6b7c02cda@cherry.de>
Date: Thu, 4 Dec 2025 17:27:17 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-19-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-19-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM7PR04MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d7603e-5088-4d31-0a92-08de3351fe45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THVVMkVXSmtNZTVOU3kwcEp5TmNOMjkzL29INnJTSnlkai93MG5xMkw1WHVB?=
 =?utf-8?B?VzlQTkZnMVlBenlXT1lLTG1YNHVWN2lacG9xemNYYmFKL25WemtrM2RuaWVF?=
 =?utf-8?B?TWlnR0U4VFlFbHd6OGZPaW1BQitJbGNDSXVFSXZUUjlPMU9USytJVjBTQ0FW?=
 =?utf-8?B?Qk9iZmJnQmQxTEtzMndiaCtQblAzZ2Z2Y3ExeXJDOSsxOUFUa0IrYWRmM3c4?=
 =?utf-8?B?OFRJTWZ0bkNKUjU4QjhFSEpRZ1EvNzZ4cDJBUFMraGNIeEFLU0hKbFhGUUQr?=
 =?utf-8?B?cFNBM1RlKzJiOThqL01zOUdDdEc0dVdIMGl5SW5sSVE4bHhBeFZ2eUdHTVha?=
 =?utf-8?B?VzkvUDI2NUliRXZkbHY4dEFoZ084SnYwZ2swL3F1N3NzT3VTdTRmeEdjM24y?=
 =?utf-8?B?WEUvMHpZK0s5TklpRlVkck94L0tmQ3NOdzNPY2VtNVlFSEtEcHd6WUpqMkNU?=
 =?utf-8?B?a1NnWU0xeUl6eGI1QmlITmt3dmVFcFlxQlByeWc5aVFPQlVwT0UzZHU5SWhu?=
 =?utf-8?B?dktyK1hOR0EvcWFhZVJ0NlF6NnFkWjA4QUFQOTV1QW9wYW1QaGVwUXJ6Nk1y?=
 =?utf-8?B?ZVVZb2lMUTY0amF6cnAzWkE1a2NxaGg5Skl6WVBGalZLdU1NRnhXK0xvTEox?=
 =?utf-8?B?N1JFSmVtRFErTTg3c1Rpa1ZmeEgzdExGZFJ0RzdpZTZDYW1HeUgxSXR0MTM2?=
 =?utf-8?B?VFozdHpUSmRrY0JlQWdYUFJVYnE2RWRhWk9pV1dhY0RkMHF1YkNwL0w0b2hi?=
 =?utf-8?B?WmEzMnpwY0U0UEVJOE5OK3liRGdzcVk2b2lDNnkydDB6bU0xMi9RTlcwaFRu?=
 =?utf-8?B?aExycjdHZkEvdmFkMC9QdFZoaXVYVnptRFJKeDd2MGg5akVOZTcyZGFINEd4?=
 =?utf-8?B?cjNNTzdwOTZsRGYrTytybXd1MmhjTGk1Z09jVXg5MWMrUldpUDhONDZoR3FU?=
 =?utf-8?B?aWw5aVZjL1JSR0o4K0xuWDJIY2FPWWh6c0g5WnRQNjVFSjROTkIyeXQ5UTJz?=
 =?utf-8?B?anNOVUk2WndQbHRJN0ZjWkxSZk92OVMxUGEzeC9keUtFSjNWbHBlRmFjT0k3?=
 =?utf-8?B?OFVYVVZnakIrYVpOQnB2ais1cTM1bGMvQzJ1VGFUQWtWdGRNeVE3aTVJcldH?=
 =?utf-8?B?VFlPY0FVYTV5aklLZGFwYzNpTTVta2ZXclJPVWpIU2cyNzdVeFROK1kzOVNa?=
 =?utf-8?B?WERzYVFnVTZQdnlvSEVRUW9lUEtBUGFiQUk2VVMvWVFYQUNFTlhPbUNQYXhS?=
 =?utf-8?B?RVJoZUdmUjdESGY5UHBWclh4Wm5TNnU4b29jWDVFRVY1THpUYW9sY2g0VXZW?=
 =?utf-8?B?UDlFWEU3cHlOWWhwa2FOdUpOQW1pL3BNakpkVnVhb2pRTWMrcmJBT0lUSk9F?=
 =?utf-8?B?UTQ3dVNZZjRlSU0vRkVEdkZab0d6dEt0RWNqaGplalA5NldPQU9Qd0dTT1B2?=
 =?utf-8?B?TlMrNFEwL3RYWkcyN3d0T3BXMFFvWERPMzNmYjFQemFkM0c5YzV5MCtCUXhD?=
 =?utf-8?B?ekEvaDc0ZkJpeGcxYWN4VDkxVHN3VTlUWHQ1MkV5aUo0djQyeElmQ05kRXcy?=
 =?utf-8?B?ZTFvenNEVTFSWFJzdGJvMW0zTkJTWGRlS21FRnhPTythMHUrWVRDS2J1WnN5?=
 =?utf-8?B?SVV3ZzhrUFJ6QjBwWk1hY2Z1bFVVd25BSjFJZ3RSaFFTODJzdExZWmthVW1J?=
 =?utf-8?B?eWhzV3hVT1lmb214clpkT1hiVENGYkIxR0swWmxLTVF4SStTdXMzeHpTTkFj?=
 =?utf-8?B?WGdmMVE1SEZPbXczMXhXS3h3ZzcyN0JKbytLcTVienB4Vzl6NktlUHpZWHZ6?=
 =?utf-8?B?WEtEcTRibnVDL1c5RjVLVXFHRkVleU1IK3RFY2lTS2tKa0I5MDl3U2ZES2wz?=
 =?utf-8?B?NEZ3NEVLNW9md1g2OEdaUG10R1M4dEc4Um5oREloaWc4amN0Nzh2cVlCUlQ4?=
 =?utf-8?Q?sYxaPYqdH9G1WtNyjyvV+F3fYjfur+Gp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ovOC9uQk1Mc3RXdDdwQ1A1M1dYYjBybHBTRktCaUpDejU1bGl6Y3pjb0Vt?=
 =?utf-8?B?U2VjcmlJMk5FczB3VDZQeEw4dHlNU2ZOR1EramR4U3pRNnBkMHRDVTQ2SnU1?=
 =?utf-8?B?NkMxdUpLSUFSZ1VRZ2tWMnBVaGpaT0FETmFGRitwenpiVG16RnhUSFo4M24w?=
 =?utf-8?B?ZkxkWkpYQ3VPNjdKK0tBRGN5MFFDS0F3VVNsMnFmNUVSaVhjWGlReE1PMG9M?=
 =?utf-8?B?bmliSDh4bEV0Q2xMbWx1U293MFJQRmIzQ3ZSUk16UDZ0OFlxVXEyTjgwalNy?=
 =?utf-8?B?aXk5Sk1VYTRrYmttSytJWit2SjdWUVdISjh5c2U0bHltMEVNTzBOK2UyRU1h?=
 =?utf-8?B?K1ByNVUzeU9qODRXVDYrVWorZG5lVXBXVVZva1NCNTdySlJrWjhRRjJWZStJ?=
 =?utf-8?B?emdIQXg4Rmg2a2ZJRkZxK3p3SnZHemt4Vzh4NzQydXk5R0pOSzFqT3RxemRS?=
 =?utf-8?B?cW1JMzNxMGQ2aUxlRVhmVnU5bDFCZHlWRndtT2xjaW81VDQrSWJtaUpsQWNp?=
 =?utf-8?B?N2U1UnB0TVF2elhDNXhzQnB3cFJMWGQzRnR4amo4MlZCZzRHMlVieFRXbmdW?=
 =?utf-8?B?VzF2KzZSK1ZVMXZQNG8waHViVEtlelQ0UktKWTdXTi9ucjU0OFEybjBlL3VF?=
 =?utf-8?B?MVZ2Z3g3ZU1IdXdiV0dBZU5RMml4bklkamZlWDhUL3kzTUxIWVN3bFU3eXhS?=
 =?utf-8?B?OGtUZjh3dktoY3h5MkJVMFZMTkpYZjFsV0ZiVnJCSm1hMlpiU3duUWdHQzNS?=
 =?utf-8?B?R0hXN2FHM2dpbTc3ZFpWSmFUbkNEN2U0MFoyZFdvcko0UUl0amljdllJQjVq?=
 =?utf-8?B?MUswbnJ2OHVVRUptSHk2cjRoaUpPaVcyQWN0aWtEMHRCdW8xZ01TZzFZeWlp?=
 =?utf-8?B?Qk5XZVZndHQ5emlYZW02Qm10VjREeHlCOUtXYlh0b0lvaE9IYWtET3JxVlJt?=
 =?utf-8?B?dHorNW9iU21LNml1SWtPZkZDbDNhVGhiNHRDZkQ2Y3VTM3dLSFd5MWZ0c0hh?=
 =?utf-8?B?R28yMDB0MEgyVlV1bnFZV2JCSHdwU09CbC9GTHlOa1JzN1pPWTA2VzRSRkFt?=
 =?utf-8?B?SUJmT3ZvM283aGpiTG1sUEJ1V1hEOXk4KzR1RGhZdm1zMjNqL2YrczJiTWNw?=
 =?utf-8?B?K1RHbjlYQ0dtT0N6SG1DTGFGTWdrMXAwZ09CbjZnQThFVkJjY2ZFRGRqV2pE?=
 =?utf-8?B?S1FtM290N2ZDWjVmQk41T2U5cW5STFpDSEY4NTJXdExielFBV3NlRnVMMEdB?=
 =?utf-8?B?VytwMzM3WnIxNjBLT3F4b1grMG9ZditHc1d1Z2RsaDhFdmJOZmhlV2N1N2Rk?=
 =?utf-8?B?MUhUMWxZb3VmdmdyNlQ0SnBxVFFMTXhhc2MrMGhtM2gzOHk0bGNNeXlSejl2?=
 =?utf-8?B?alZ6MzBnRnFyR0lwRXFmL213MWF1dGxWdzBxYkpwNFJiMjFLVnlqenFJUWh2?=
 =?utf-8?B?cWlWNC9FKzNRaEU1YnU5dzFOQmY4eUVwRlhNQTdTMGlZck9vQ2ZkeEc5TWlV?=
 =?utf-8?B?NTNTM3I5R202K2RyWXV2R3VMYXdQWVI3WjVwclVjbjArMWluZjRUN2VRam5x?=
 =?utf-8?B?cXJ4RjFyVCtrVWxMQXRWL05kWmxnNmdDWW1PMDJ5dHdFc1FUMkNWMS9TdHkz?=
 =?utf-8?B?T0F1ajVLYUVRMTRpdVBSMW5kTGhHeTduUjduRHFoTDltYzdxZ08yRTZ4ZU1S?=
 =?utf-8?B?WVVyR1RvdG8wNGUzTjE3TncvVXRybElDRmZYZXppNG5Ja01nYkVMb1dUQVBh?=
 =?utf-8?B?N1MweG5WN0ZNTjczR1BkZDg0dDVqSmN3TTh2bEdtcnBSeVdBVGZ2Y1RNanQx?=
 =?utf-8?B?dzZRY0FyNENpRjdwMXpTb3I5K0NlTnIrN0QxWWFHSElLV09wV2dueUZBMUw1?=
 =?utf-8?B?djlwMGdYeGVQaFUvRlFTM0VPMXVwanhTc1hScUJ5SS9qdld1ek5OSFZhUk84?=
 =?utf-8?B?aVg1OHdVWTNrV1prblY2L1N6Q0ZBR0ZzN3labHZaWWl1TUFiKytWV1VTZS93?=
 =?utf-8?B?Q0xkYzAwd2hVTmZTSFRabGNhREpXZkFGNnRsNG9MRnhDcDNlK2FzbXhnWnBV?=
 =?utf-8?B?QXBBeGJ2Q1FYeFJld0NheVZBbXVhZGI5VlF0YUptWThlWmZUQzNhQjRpNTdn?=
 =?utf-8?B?NGdwOUJMdmtPRnovekFCZnJOd241YVdBLys5Rk42MGZRU203bHl2VlpWYWdC?=
 =?utf-8?Q?wx7rIsmCqu0N/LO54If3VO0=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d7603e-5088-4d31-0a92-08de3351fe45
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:27:18.5536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsnFIkfuGlgUz9bN8MOxjhnhsVBc89lIKmybtXJQDUFvXojd+ZtRVK9on74i0SGtgKFWtj3r86FwZg4dQgxicRR7/ERsroc4Samid+xpqTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 18/23] ARM: dts: stm32: Drop "u-boot-led"
 and "error-led" from stm32mp157a-dk1-scmi-u-boot
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
> Remove obsolete properties "u-boot, u-boot-led" and "u-boot,error-led"
> from stm32mp157a-dk1-scmi-u-boot.dtsi.
> 
> Remove led-red node which is now available in kernel DT.
> See kernel series: https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=1022570
> 

You may want to wait for the DT to be sync'ed with Linux's for this 
patch so that the red LED can still be used with the led command?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
