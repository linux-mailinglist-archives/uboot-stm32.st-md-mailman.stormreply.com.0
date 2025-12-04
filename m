Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC48CA44AC
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 16:38:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6165C5F1FC;
	Thu,  4 Dec 2025 15:38:54 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60F61C58D77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 15:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4Aom2YBEmhg1EgOJStPpFG92e7+wvEOFDNbJ1YVspRQdVgtUHnUoYjp+8VF9aiMovpJGdk7U9mdynvxmKjStkGwgKy1DqsdiNyR6h9ENDeuXxPqetLqm+tDhn/efGFy2Cl5ACFdWKf/UKlWrugzaMD6sLleD3Jz5z+EQs/FlIw3zjN2PU6/mMB6RlL2EvHtRXcMkqAqJCtN4DzPGcsVCvVVmnt3v2kKaN3jV3QWIL7P0oZ90IYGIWkxjrQNx+cpeW9dLn1cMM0gFmlssBV3LLSoiASriQCdpR3K3IpT1tLhS1IHDeO6DalX+Goy5svV+haa4SGjwIbxZcyLifE+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q0cqbb2iNR4wjSwdHrzKn1KewXKlrRT9C68Xk3tEb8=;
 b=XL2UNl/+D34yqjW9LxxeApMJQFey3P3c5lL1FBMHno9xq/Clvs7u+QbRbeSE0pgUbeO/0UeJvcsSV6jJjLMZsTEyKD7CE7Hof/JMgpjpS8cDdJKQkg346upjzX62aOj8LcTkrz9xRgocbI/8CHOXpDrc8ignFE4hjdCGp3GmiDK8xTnC3x+Ez+RSte4QUi4zD7Z1V4uVlifpS9SnPDuf7cYX3+3kRKKzONaxGbqTm0vaVmW9uCDLl6ikSo/83dxTK8j7tJmYbEIsRFIhU7g7KjIsakV+cT8vmEqmu96/riythv+cNb6s31kMU0hr61Wa905rhxWDYngbf2MfOhkvjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3q0cqbb2iNR4wjSwdHrzKn1KewXKlrRT9C68Xk3tEb8=;
 b=Etkq38tgLlVcBOsw4v7Zzcggo955v2/HXpkCqZnRVMQ4EP60kClrn9R+CP5lRmTDAb2y/Q9n7td3wazL/3LjyhKrTJApntBtYeHxRh4Nzn50Zwq2y1Rqrd07vbnzU04b7hr5UZY9daOyqp/bgG4jXTy6vYO4W4oZuGasi2w9McQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11080.eurprd04.prod.outlook.com (2603:10a6:10:587::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 15:38:52 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:38:52 +0000
Message-ID: <309e316f-1be0-49bb-be93-609d8b29ccaa@cherry.de>
Date: Thu, 4 Dec 2025 16:38:04 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-3-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-3-patrice.chotard@foss.st.com>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11080:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8d7244-cb96-4d9b-d786-08de334b3a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z04yN2xuZkxzZHVWNVFsSjh0NkJML1Ntd1NVS3djc2hXdllDcS9mOUZjdU9y?=
 =?utf-8?B?WFhFWU1ORWkySGRsQWFJYlJKeUM5Zi9UQ1ZSOEVSdnc5OXJFUVdYeU1tT3FL?=
 =?utf-8?B?S25ydkRvSENSUWNiOWhPTytObUlJeUp6Z2Y2M2ZsVjU2YnZ1VnJ4MG9XK1VV?=
 =?utf-8?B?N3pXa3BFbWNQb2pwQmV3V1pOVXY4Z0VSNEpzdjA2SG1qVWVKaUhIVTlBWEhY?=
 =?utf-8?B?TWNFNlBXNXJFTEJpRS9LMFZqV2FEMXZjMVBlSE5tYW9vUjhNNFpjdEoyTmJp?=
 =?utf-8?B?QzNESmY3cDEzSFRPVkwrZllzLzVoVEwrZkxIa3NwYW1MOFcxcTZ1Wkh2bUtG?=
 =?utf-8?B?T3Y5N1hhTGduK0I3ZFlNZXEyLzZaWnByd01tUmQva01VL0p6QlptT0FYV01r?=
 =?utf-8?B?Z2N0aHNrSXZnYkhLTXVIWE44TXRFdTYyOVJ6R3QvWEdtL2gvOXJaQ1NqZ081?=
 =?utf-8?B?NFNWQXI1TWw2NDlQdkRqRG1DdlFSZWNXQTRSRmRsR2s1bXMwSmk4MWU4YU9z?=
 =?utf-8?B?cnI4WHdrMEVhOEZKZUk4R1paRjRvVHdSeE81NFBhREFETmJxUFJ6ZXBHRnVW?=
 =?utf-8?B?WkpZNXI3em0zUHV2MnpRWVpOZUVBZWZ1UERMK29ZSm95MnpRQmZmaVJZZlpk?=
 =?utf-8?B?UzZ3NzMxUDNzdGV4dURZR3A3SDdtTE91RTlZOVFxdlZoSWg2UWRpTnY4SVFu?=
 =?utf-8?B?K1BybFU2aCswOTRCam9tSW44a2s3OWxiTm1rNWdQU1gyWmNwTzFOTUNwUER4?=
 =?utf-8?B?UEVjQ092SWRDWitFcGx6K1p4MlF3K1p4c1Z6QU8yeUJqeHI0Y0NUek0wNmxt?=
 =?utf-8?B?RFI1aEx4U3l2eTZkL3A0Y0g4MnprK0MraFlHamw4Zk1lQktQWmhodTJKUHBG?=
 =?utf-8?B?WW9QYnhRcytYU3ErU1hzOWRkMVZPUUJpY0w1cU1ZdkQzNElrRkNpamJNeGlu?=
 =?utf-8?B?MlVyZjZoK05iSzJWYVFCQmQ3Uk9vejZsU0FxVmY3SGdFVmsvdlNlZWNTOVcx?=
 =?utf-8?B?TXc1cmZNV1pSWVdjclZDTDRzYjZPazhUWkFJbFlDTk43VVkyZ3hIeURIVUJo?=
 =?utf-8?B?WWV1ZThVTTJxbjlYUVJTSjNnd1p0Rms1MTNobFd4USt3ZnpLQTZsTjFQYWZN?=
 =?utf-8?B?VysxUTBjckZxVjlTUmZVcjlIeVJ5eDNpQ0JDazg1c1dsc2w5SnMyd1BvSmRT?=
 =?utf-8?B?OFUzd3FZcFhlcHM4a1VjVm1hbnE3dlFGb0QxSitrZ29RSlRyblVrTHZaQk14?=
 =?utf-8?B?S1Z2NTJqSU9EaGtYK1J1Zjc5RmtPMVdkZ2dsYnlUYzRFVFAwams4ZlhaWXgz?=
 =?utf-8?B?WXRFdlhYeFJaL1U3UnVpcStQZTFPQVA3eGk5VmZvQUw1clVJSXZlcmV2TUt3?=
 =?utf-8?B?cFN2NDZsZDdiaUR5bC9XTkNkNmFLaDBwOWdpNCtWMGphalJnYXBZcllVWkI1?=
 =?utf-8?B?WUF1aS9EY2N1SC9UQXpnT2lLNXNxN1BVbWV4dlNGOEFtbFJuSzQ2ZGxjUTM3?=
 =?utf-8?B?bFZDTTBSMlcxWlc2a1V3OXJuMWlVcFpwYjZ3UWZwMWlFcXFjeXI4OHJBOWRM?=
 =?utf-8?B?bUp3TFZXRkwrYmZ3QXJpY3o1SjEzM3JsSHR5d1lEUzdjNm5WaHVmclFyTm1k?=
 =?utf-8?B?M054VWkvZ1d0Zk9LUE1POUcyYjYyMThyRHVtQkRwRnREOFgyckVydjgySklp?=
 =?utf-8?B?L2pFc1ppSTBXVnV4NmV6aHpLTUg3WWxXYUtJdW5sSXVsVElFZHI0Z1FzVC9s?=
 =?utf-8?B?WEg4WUpITExaY2x3WitaQkhpdEFqTnJwTjZiUTFEV1hlYjdhWmM3YjJrVEtH?=
 =?utf-8?B?VEJRYlJBZzJ2ZXg5ZUIzSjBmZGRaRjV5SGlja3luQzRHUmZZVDdpQ3VKbzcz?=
 =?utf-8?B?S0ZSb0pjYWtXeXFJbnM0cHVFZHdadG9WOHZicjRYdUxheVRmQ3Y0ZFhkNU44?=
 =?utf-8?Q?F3mxQz/51xGwNbIcbXUvLtcHKKrqGBF9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0JnNkVnMjR1YUE4QzNJckdyR244WXZYL29Hd2RyQU4vNXNZMGVFY3ptMnNL?=
 =?utf-8?B?TUxrTGwzcG5ubjRTT1JndkxCVG03UGRDeUlISllPbE9HamVhbVM3c3hIbC9j?=
 =?utf-8?B?blo2YXBNU1pOQWgxM21VYXpzUjVwS2ZTL0llWjI2Sk01NVpRYWpIWnBnT2RK?=
 =?utf-8?B?QzAwNDV2TVhyaXhaZk9MUCtUdmwvNmxoei9HdWU5d2xGMUR1aTJtMXhoWlAx?=
 =?utf-8?B?cUdaakdWVGYxbnZOWHBPUjI1czhaNTFJTEV1U3k5NWw3ZjVSUTd3WXl1ZU9J?=
 =?utf-8?B?d1V6TW9wRjhtSDVqbng3Y1Y4MmhxVmprWnJySWgzcTlGWVRJSXZPSjlMSm5Z?=
 =?utf-8?B?SE1rNTBaeVo3YXVQOXJ2WFlHcWxPbTRudDB3Ui9LM3lHNktUajIveFUyT0g3?=
 =?utf-8?B?Ym9GM2tFS1hNR3duWnJIOVg5ZkxHS0IvWDRtM2lBUTV3TS9iR2pjZE1qb3I0?=
 =?utf-8?B?Q2h2TVI4bjVGR1hobGRvaDh1dEpiR2h4RmZoUW1iTFlOMUk0aERQMU9NOWp6?=
 =?utf-8?B?ei9zbmZscFRyRTFWdDVhSlUxYmU5WGI2QmJmb042TmN3Q1dvdEg4ZmdPNmYw?=
 =?utf-8?B?aTJqbWxOQ3E0d0o1b0ZlZmlCUHJteUFsU3Fua09XQ0hwdUlza0M2N3gwVTdL?=
 =?utf-8?B?T2p6amJCbDlvVlhQQ2N5M2V3Q1VEYXFzdVM4a1BUM21HL3VLU0lodHQ0SkMr?=
 =?utf-8?B?aGJxZlpnbVQrWGlvNXJjYkUzOWZvVDEybTFLOGVXWGp1Z0V5djBJanBnN1lx?=
 =?utf-8?B?dndTeVJnVlh1UC9ja1dhbkxsZkRWZVc4K0lGMGdIVTZ6bkp3b3QzcE9Sa3cv?=
 =?utf-8?B?dmxab1MySzFBZDg5cU1OeFR6eDkxVWkwZmwzT0wzZEFKM0cyWXpoUjJnSzZV?=
 =?utf-8?B?VzQyTlFCclhGQzJhcHAwa2I2Y21rRm1KMng4ZTQrOWdRTVQ1RXp5bzVKM1B3?=
 =?utf-8?B?SXoybU42VHNrcUhuS21ybVBBWGhSczNXcU84b0xmeVJvN1lqSDMyTFNqWmty?=
 =?utf-8?B?N1ZROFk3R2JoMFRjak1HaTB3ZjdESEZWRjZSRnIrNmY4Tmh5RG9IeVdIdWNh?=
 =?utf-8?B?VWlSc0Fqekh2elZhYTJQQi9aWkhESUNMVStQT21LWCtWUGp0UWJwZUQyeTNL?=
 =?utf-8?B?dVdSUXlFajZLbEorUTBWU0I2cmFUb1JzL3RrWUxOdWVMNVczMkNnZDd4UkN4?=
 =?utf-8?B?aVQ4RFlYeHBxZHFYejNsY1BGNHhkRFowK3labGxtWk9memYrbnBtU0xreTV0?=
 =?utf-8?B?OWZLL3NSaTduWHk1RGRCWWJYT21rblh6ekQrK1ZETVFwVmJxcm5Wa3FpVFpS?=
 =?utf-8?B?NGRpcGc5QlZSbDcvVUVuVTFFQVNLQktVcUs3dmFpMjNSQ3VlblRrTWpvYjZD?=
 =?utf-8?B?VGJJM3Y0M2JhM3VIRHBKOUlCcFQ1SW5XekZhdXIwQXFlNzdLbnJ4QjVNNVRX?=
 =?utf-8?B?Z3ZJOTRsY1VEYkV4N2IvZTA0UENVL1VHTVFoR0NUWVlIYjB2eVg2dVZzWmFw?=
 =?utf-8?B?SnBIMXBOaHVVaWJRUHh3d2RBeHpkWWwzNTZCemtzWXNmeDhpVDdLNmRpbG1p?=
 =?utf-8?B?OCs2dWlveWlYZDZ1QzREc2tkeUJIdWprUGFDck05eVhiSGE1QXpLRVgxSDda?=
 =?utf-8?B?MEZCd2kwL293TDNTbkFvamtUYnhnTGh5dWZ4cVozdjQwNXF5c08zdmpEMVhQ?=
 =?utf-8?B?S1dWaVFhSmYxVW1UWStId3l3SUJBQVM0M3ZiMmtoNTVDcVhjVUlhMnArdE4y?=
 =?utf-8?B?eGNtdWthTUtqSElpb3ZkNStySmpza0FnTTk5aGpZTzR1WGVXQ0RqS3Bjb1Vn?=
 =?utf-8?B?ZlFtYlJqSnNNeFNubTZUY3YwWGJqY0RyeXNUN2g5SWVNNEo1TEMvRHZsVEhQ?=
 =?utf-8?B?ZU1NalZGK216VVpOUjdaY3FsMzZueCtoaVpBNTdMTjhTaUQvYUNVUnJVWHZT?=
 =?utf-8?B?NkhOM3p5VE9mZlZ6eE1vb3dXaGlKdmU2L3dHRmRkNlQ2eTVTV2tET09Ra3Vx?=
 =?utf-8?B?RUpLd0pYV3psR1hqT3RtSFB1TTRDcnJVNWl0WjRVaEliTDNTSVBGQi9aSVEv?=
 =?utf-8?B?MlloTUZqWDIvVHdDQUxMN2w0WGxGaHljcXFYVGhtZ3ErTFhYb2h6YTR4MjNx?=
 =?utf-8?B?Rld4d0VVemVnOXJwK1J6cFMvM3BJUktGZ096Y0NpWnlDcFJKdmJMSklDQUpB?=
 =?utf-8?Q?8YSmzYvjbFbVMoOfoUUdAfM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8d7244-cb96-4d9b-d786-08de334b3a2d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:38:52.5892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3XXP9V7u/DXjwFjLngdYGxxV9C29NqiZ3M/mWRkztU+3Vi6xUTl2m8/7O23fa5rM3zNLeRiCMmGUITw4d1+pLyf/PVatW7jHi7kU+BVZkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11080
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH 02/23] board: st: Update LED management
	for stm32mp1
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
> Remove get_led() and setup_led() which became obsolete since
> led_boot_on() introduction. led_boot_on() is automatically called
> from board_r.c
> 

Yes, but called later than board_init(). If this compromise is fine then 
it's ok.

> Regarding "u-boot,error-led" property can't be used anymore since commit
> Since commit 516a13e8db32 ("led: update LED boot/activity to new property implementation")
> 
> Instead get the LED labeled "red:status".

Would this work with stm32mp157a-dhcor-avenger96 (led4), 
stm32mp157c-odyssey (red but not "status" as function?) and 
stm32mp15xx-dhcom (error but possibly broken since commit 
332facce6f5669fc1bb8d150c08cee2ebdae6d2b which removed the led with that 
label)? Seems like Odissey has LED=y and LED_GPIO=y so it probably 
worked before this patch? The other two, their defconfigs don't seem to 
enable LED support (new or legacy) so I guess it never was used anyway?

I'm also wondering how you get this string... I don't see any label or 
LED_FUNCTION_STATUS function for the LED devices on ST boards. I'm 
probably missing on something?

Cheers,
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
