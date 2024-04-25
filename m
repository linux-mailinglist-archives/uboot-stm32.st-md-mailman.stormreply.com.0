Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BF98B1BBD
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Apr 2024 09:19:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC326C7128B;
	Thu, 25 Apr 2024 07:19:06 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1BFFC69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 07:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFpa1qy9Ht3j1rq+InIfMrnHZrXWlN2nTIQlIoSdKhzf1x7E0PAhACcFR9zqFEcbRIGLLl5nnnFhiHpzpfCstsHsyO4WZagnWoWxC5LUkd2wMK48W+xc1M2EeCKvPtVHG4iUntBpp0xEZ1Sq/+n+QRR9sGANhTGvvAsPOm6NS38ggWKC3g13zWjpSh4ZWeCVazVRSWc3LnViUp40kVfrR2h+nfvwUgK6+/UHBgBFJ2/mOBAR4UwG1XZcRtOV8YRabeybFtAA3btPeHRkBt8jcrKOLNh7HQAa9tFhWz7cDverdPF3FC+CSdME+ALJJyFbTcRzRWDtz4wAMNNJ791DdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90Lu1P48aPVgRwpemLMsjPXq4h3E+i6e4PstMnPGLDk=;
 b=M44gr61uWpz0Yz1lEdz9+yJ/rpOEr2Lp4gGKKFlyLlNTfhxIRGY19Gc9M17PbIT2xjd0QtopCo22I0RHZ0iClx8KcPbaUACleigEHvEWvgWdxGFiEWarJXqMFHhckZmPVgj/dMrHO/6TTwmjWjCOFUAYfqrkdWZhWgVTY6eRVsFxsaanHsv+5HECHYZiyMlB4YbZCiAwtWfb9zHdtEGCPr5x/0DjHcAJdtD6YBnf4/bv3fqb4b2t7ut/Wto/0s2dJTW/QFsU8pbQ4+woNztlzQIg1vZ91oE5HwoFZ6dZvTBJ1XEG5g8GOoEiaARWdGmZrHCKg2YwQ/V1JRV0ByejFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90Lu1P48aPVgRwpemLMsjPXq4h3E+i6e4PstMnPGLDk=;
 b=tl/iF/AoT/k6kqJGhF8LVcTvjaAmnIAeVI1bahLhNZrUWglk40Xuetbsg05dkLXFybumcdGEE810vqyY16/ALDN3WusRdvzb6YUOLvUIK3QfWorhzuEtKlr8j6hUz7SRLwzwtbbIn5KRr9bgRI/vsVkO5ejaa6Vq+FoGp6bmCik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 07:18:48 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::c3fc:3be9:dde7:745f]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::c3fc:3be9:dde7:745f%7]) with mapi id 15.20.7472.044; Thu, 25 Apr 2024
 07:18:47 +0000
Message-ID: <f3abe7a1-72bd-4d63-89b4-3a8f742a5d73@amd.com>
Date: Thu, 25 Apr 2024 09:18:31 +0200
User-Agent: Mozilla Thunderbird
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>,
 Richard Hughes <hughsient@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
X-ClientProxiedBy: VE1PR03CA0047.eurprd03.prod.outlook.com
 (2603:10a6:803:118::36) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f349254-5ff2-4f0e-7ac6-08dc64f7f2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q29jS3poR3pDUUdvcUNKdzZTMy93K1F2d2RTOWJUTUVQcVRvTzVsd2pDNEhD?=
 =?utf-8?B?QjlzMGJSYk5mM0NJeE1LaDRLUWlnNVlZM3M3RjZRZkU3OXJ5RERONjBQUjBI?=
 =?utf-8?B?VUJLdnl0bHppeXNjd3MwNmdZVDhkcFQvc1B3cVBBaklPaTVKS3VCclJ5ajJD?=
 =?utf-8?B?dExVZmRZMUl6U0NhNmljWW1Qdys0Tk9BZ1lLZVIxSW1OaTlIekJSaFYwekYv?=
 =?utf-8?B?cnJLWWxYM1ltbURVVk41UzFMbVZ2NVRNcHhYVVlTNWlydk5GL1FDT3dFUGxZ?=
 =?utf-8?B?MngzTjBhK2dVd0xDbldhaW84aUNSTzIyOE5GbE84eGx4VFY4MWJheG9xdmJV?=
 =?utf-8?B?YUNGZ1V6b1BBc29TWHg2VzV6VmVaVjBreGFRRXZoN1JnUGxlbThqT1QxMDlJ?=
 =?utf-8?B?TUVWTEJNcGhBcnZYZlBxT2o0ZW5MRlBOYkZBVzZWYTkwdUpCSjIzZ2huenI5?=
 =?utf-8?B?NGg4YUhmblh4Q0Y5UUE2TTIzNEtKK05DcUtzdDhnUkl3azZlS1FNOW1DWC8r?=
 =?utf-8?B?Y1VVZzQyd09YaUIxVGx5K1ppVTBsQ2FMS1NYaXNsQXR5c05aOTQ1OXA1ZWcx?=
 =?utf-8?B?M3VqamdhVFN3eDg3cDFCREZVSld1THRjV3N3ZE5zV3lQeVVqTlNkaXJhTU1k?=
 =?utf-8?B?RGJIenJwdEwrKzNaS1RpR1FVUjRxcGpvUUNPZFR0MnZoTG5WVUR3ZW0yclhv?=
 =?utf-8?B?T3JXRlluanFwQ3U0VklicWJ0SWxqUjZwaGx0Z0JoaHBIYnpmV0prRVdoSWh2?=
 =?utf-8?B?Q2RxQUhUNCt5UTkvNnJyTUlpWS9ncE1zUWUzbUxTTnFhZzB4K0ZUbWFGWi9a?=
 =?utf-8?B?eWJ4N2RhQnRTTmphQXBWMzhXdWt2c2I4d3FMTTdPbk9jcVdSbml4eFU3RDNY?=
 =?utf-8?B?Z3l6OHhNTUdDSDAvMmdOVVY2emhJZTVqUUpaR2F6N1dINGJlQUhZanlaOW5w?=
 =?utf-8?B?RjllSmowSWNLdGNSS1ZYR0lraWpmeGZFeWtpc2F5cUF4VWh1aFpyVm5nZlE4?=
 =?utf-8?B?bmZrOEc0OURFYk1sUHI1VXNuYTNST1FkVjVFZ1ZoL0szQmNpK044aE1SSVhi?=
 =?utf-8?B?RkFFalBnMG5xVExNcWwyYjI3cGpSRkxJaHhtUklXNjlRZDF4bEVEU3NDQzRk?=
 =?utf-8?B?Y01RR3pYajFjYmx2aVN6a0I1dmpIaStJTU5OTzg3eWIxOTdBWkE5RGlzRWNy?=
 =?utf-8?B?K2lMcVhQOHZFa0NhbTBPdzgxREc3ZGhaa0Z1cEp0RlVJdEhxT0tnZGlnMWZT?=
 =?utf-8?B?N1dzVDVhaTNqaE00T1BIUlRGRzJmSTF4QkQzb0V5b2Y2bDJ4NytLd09GM1U5?=
 =?utf-8?B?bXJZeFJBcVpFSWxUWWE1Yy93bmIzdjZCNjVROG9nZlNSSUxibEJtaUZhL2pu?=
 =?utf-8?B?aUJHUjAvUTBzU0RCREpia1dhaFdHSnRVMFlrajlQZjEvaTBTS3V4YUJ5VWlQ?=
 =?utf-8?B?RmNodWlUZG5Ha1VKVk1ubUlMaHhweFFaZmU3K2JBb1hhdE1OUWY0MXFyc3lo?=
 =?utf-8?B?eURuMlZPZUFqbW5JMXgra2FlZ0xQTFF4S01ESVNNUTRKaE9vbXYza2toNUJW?=
 =?utf-8?B?SE5tZlpuKzllNExzZHdZMVJ4RFlMdUdJV0lvNHI0SjVjUlN1K3FWVW5GUHhO?=
 =?utf-8?B?V0hWTkVPRlRnZnQrd05GdHU0bHBCUitTVHNuYWhrdEhONHRKOTd4elBNVFpK?=
 =?utf-8?B?azdPYXpxUk5ISGdXRmVTNVdmQUk3NzQwYVlCaVBFV0lmYUdLYkNSWU5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8109.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFMrTDRMN1BZQ2w0dWNrd3JWZnJuMVR2NW1HQStiQk9IaXVXNlR4Y0hWOWts?=
 =?utf-8?B?SWl4d2FpSDl4MjU0SXJLSmRGWjBsS0ZYaFNtTVc2blE2R3kxMUEzZUhHZFBR?=
 =?utf-8?B?QzVLY0VWOUxHeGpoZTVtM3pUcm1MS1pRTE50eC9MVWgvaXdTYjRZQnRoak1E?=
 =?utf-8?B?anE5WVdTZlZDNmhKcHcza3pDUTd1cEpyZjBDUklEbXB5dlk1NEI3V3hhakJt?=
 =?utf-8?B?SnNUQmJPV3VJZVMzYVBhMjBHWjVXcE9OeU1wbGRoaWRpK3gzYmJhWExKQWxI?=
 =?utf-8?B?NTNFYW1QdHJtcTA2dERrWkladkVyRWgvOWltcEtwenhOZmZoQjdXYjBOLzlS?=
 =?utf-8?B?RHFsb1ovSTFjeGEvVFVpTWRMMlpjMHAyQ0s1TC9rZWd3MUx4T3ZHM2NBUFl1?=
 =?utf-8?B?SC9HaGZpNjhXM2dkd1FqTjJGOTh3Z0NPbEJ1cmhISFdsNnA2QjV2Rmg2TUhI?=
 =?utf-8?B?UGFta005ampxazl3Y242T3diZUlOY1lzS09iZ2c3cWlYdUpnUDZFQk5wajBw?=
 =?utf-8?B?Z2pCc1pEdkpPQnBrUllDeE4ydUE5K3djdExVR3BnV3ZicmJRNklNNC9yRkJt?=
 =?utf-8?B?a3Jyenc4MFRqSzhQbHJWcnh4QnhWblo1RUxOM2N1SFg0UkxTbEFwbTU3ZXdC?=
 =?utf-8?B?Ui9KKzVVNVVuSTQrT3lCS3ErZGxBZTVWZmwvWmlNSGdwT0tGaW5ORElobmgr?=
 =?utf-8?B?b0xqbmJIVlVXbnlxcEptSWJ1VHoxSTI5eTRBZmgzdzd6NnBzbTNDMUFBb2xM?=
 =?utf-8?B?eEIvdHd2TEN2MnhzTTl4c01vUnE3Ti9lZDVhQ2JRZDZCOWxTMjRWbGZTYUNu?=
 =?utf-8?B?WEVtMjhnTHVRMDZPRnhnRXE1czZWRXNKRlV3WGhWVnlSMjJEM0kvR3dQdU84?=
 =?utf-8?B?Ly9uQUQ1VzNiUmMxcDYzdXE3bTczMW9qTlJYcGNKb2xPMVg1NDM1ejcxUWNi?=
 =?utf-8?B?eG9pMG5zNGhoekdMRmF3ZTByZmhFY0hxcUdBV3F4SnBtUjU3UGtQUzVzR0tV?=
 =?utf-8?B?SWJFQzRYaGYxdU9VNUxHVGlMRHNCTjNiY0puR2hZbFNqTlpXUjE5aEZTOG5M?=
 =?utf-8?B?M2loc2cxQjVIT090Y0FRTENVRFRDSnMrV2JhMWExZTJQc2J5bnhBTzZxb0No?=
 =?utf-8?B?SWx0Zm1yNVp5QUNIWEJJcmZxQlRpSUdBN21uOE9Jb0JkS2IxcFVFcnRIOFVJ?=
 =?utf-8?B?Z3M5dWxsQXJqQXFlMHYvMWVOUWxhcktGc3pHWmQyNTVncnNaWTh0b3dGVTAx?=
 =?utf-8?B?UzI2V2V3Ukl2bVJIUHhnMU1qeEdUVm5tOHFUTWZGR1BJL09rZG53bXBUS1FQ?=
 =?utf-8?B?N2tPaGhZd0ZMVWptYkdCUkFrOU1Pc3BxM2tvOGxPZUJkMjNrNkNma2d5TGxO?=
 =?utf-8?B?bVhMclJ2Szl1dng2NGhCOFdkR2U3QWZxdHNWQUlLVnFGWVB5ZXZ0NG0yY2Ns?=
 =?utf-8?B?ZnMwNVl4RDh5MklRL05zU1BpeXN4bmxIN2lxZHNCejJrS28vSE5vbi9FalNT?=
 =?utf-8?B?N0kxVFBBTk8zc3hmYWhWMVZrYzdiQ1pvcFMwWDhjK2wzM2QwV2hFYm0wWG5m?=
 =?utf-8?B?YUpUVDJmUXFsV3ZNSW4vdkc5RG1QNS8wYU5xRUxBeTNTekRpUzl5RE96enhP?=
 =?utf-8?B?dXNaNHFIQjVvaFVuYVJiUjh1OEZ1NUtEd0ExZWtiTjFmeG9rSk8wOGN6L201?=
 =?utf-8?B?M2UxTkNySWdwK1F3M0tXbWovbU9oNlBFajdBdGdOTGl0cTNLL0dNNjdlNFVG?=
 =?utf-8?B?M0U0TEVDcEdEOWNUbXNBOHEyNnc0U0lydTlBYkp5RGw5N2hiK1lZZ29DZVpE?=
 =?utf-8?B?ZzB1VG5vRGNvT3o0enFqRVc4eXdhWStsaWdWOU9GVHJKZnRSVjAyOW00YlZI?=
 =?utf-8?B?NjBqYnJDMzYrWUlxSHBPNlhlcldSRnorUktWY1c1N2wwVlc2SlVwUmdIYjVU?=
 =?utf-8?B?Uzh4NXduMytNY1FyL2plSFRTckJLWTE1VUVxM0EwYW1rN1JsKzhaa1JwKzFq?=
 =?utf-8?B?VUVPaTNHbHNtQk4vV3M4NVdJT1VMUGQ4TkJoVEFvT0J4MVM3Rk9QZ0l5YnpY?=
 =?utf-8?B?NktQbVB2MGJQSG1YYzE5Z0FROWN3cE40RWlDcmFvSDQ1OVZKSUJYQ1FPc3Nn?=
 =?utf-8?Q?ayKH30+GQDUEmk1yCWwf2Q3Lq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f349254-5ff2-4f0e-7ac6-08dc64f7f2f4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 07:18:47.8135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWj0tkserLjfv73XPHFuBiP5V3PUuT7j+yLDFhY7jPdZg29O5LpktpX+bGGLAqE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michael Walle <michael@walle.cc>, FUKAUMI Naoki <naoki@radxa.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Paul Liu <paul.liu@linaro.org>, chris.obbard@collabora.com,
 Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Uboot-stm32] Capsule GUIDs and LVFS
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

On 4/25/24 08:19, Ilias Apalodimas wrote:
> Hi,
> 
> Richard maintains LVFS & fwupd, commonly used for firmware upgrades.
> We recently discussed the U-Boot status and supported devices since
> fwupd supports capsule updates.
> In order to be able to support capsule updates via LVFS manufacturers
> should bind their GUIDs to their devices. Any ODM/OEM creating a board
> based on the original device must use his own
> GUIID to avoid confusion. If not we would end up with different
> devices reusing the same GUIDs and upgrading their firmware with a
> different one.
> 
> Looking at the defined GUIDS for capsule updates defined in board
> support files I found the following
> 
> Richard, the following GUIDs should at least issue a warning in LVFS
> since they only work for QEMU & Sandbox internally.
> Sandbox SANDBOX_UBOOT_IMAGE_GUID 09d7cf52-0720-4710-91d1-08469b7fe9c8
> Sandbox SANDBOX_UBOOT_ENV_IMAGE 5a7021f5-fef2-48b4-aaba-832e777418c0
> Sandbox SANDBOX_FIT_IMAGE_GUID 3673b45d-6a7c-46f3-9e60-adabb03f7937
> QEMU QEMU_ARM_UBOOT_IMAGE_GUID f885b085-99f8-45af-847d-d514107a4a2c
> QEMU QEMU_ARM64_UBOOT_IMAGE 058b7d83-50d5-4c47-a195-60d86ad341c4
> 
> I've cc'ed all the people I could find in board specific MAINTAINER files.
> Can you respond to Richard with the proper company name & board name
> so we can bind the following GUIDs to a vendor properly?
> Richard any guidance on how this should be done properly is
> appreciated, since I am not too aware of LVFS internals.
> 
> Advantech IMX8MP_RSB3720A1 b1251e89-384a-4635-a806-3aa0b0e9f965
> Advantech IMX8MP_RSB3720A1_6G b5fb6f08-e142-4db1-97ea-5fd36b9be5b9
> 
> Compulab IMX8MM_CL_IOT_GATE 7a32a939-ab92-467b-9152-74771b95e646
> Compulab MX8MM_CL_IOT_GATE_OPTEE_FIT 0bf1165c-1831-4864-945e-ac3d3848f499
> 
> Kontron KONTRON_PITX_IMX8M_FIT_IMAGE_GUID c898e959-5b1f-4e6d-88e0-40d45cca1399
> Kontron KONTRON_SL_MX8MM_FIT_IMAGE_GUID d488e45a-4929-4b55-8c14-86cea2cd6629
> Kontron KONTRON_SL28_FIT_IMAGE_GUID 86ebd44f-feb8-466f-8bb8-890618456d8b
> 
> Radxa ROCKPI_4B_IDBLOADER_IMAGE_GUID 02f4d760-cfd5-43bd-8e2d-a42acb33c660
> Radxa ROCKPI_4B_UBOOT_IMAGE_GUID 4ce292da-1dd8-428d-a1c2-77743ef8b96e
> Radxa ROCKPI_4C_IDBLOADER_IMAGE_GUID fd68510c-12d3-4f0a-b8d3-d879e1d3a540
> Radxa ROCKPI_4C_UBOOT_IMAGE_GUID b81fb4ae-e4f3-471b-99b4-0b3da549ce13
> 
> Socionext DEVELOPERBOX_FIP_IMAGE_GUID 7d6dc310-52ca-43b8-b7b9-f9d6c501d108
> Socionext DEVELOPERBOX_FIP_IMAGE_GUID2 880866e9-84ba-4793-a908-33e0b916f398
> 
> STMicroelectronics STM32MP_FIP_IMAGE_GUID 19d5df83-11b0-457b-be2c-7559c13142a5
> This seems to use the same GUID for multiple device variants. This
> needs to be fixed
> 
> AMD/Xilinx XILINX_BOOT_IMAGE_GUID 20c5fba5-0171-457f-b9cd-f5129cd07228

this is versal GUID

> AMD/Xilinx XILINX_UBOOT_IMAGE_GUID cf9ecfd4-938b-41c5-8551-1f883ab7dc18
> ditto

And this is ZYNQMP one but that's just a note.

What has to happen at least in our case when LVFS is used, we need to generate 
new GUIDs for every board because we can't use the same GUIDs for all boards.

Thanks,
Michal
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
