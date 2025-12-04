Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04762CA4558
	for <lists+uboot-stm32@lfdr.de>; Thu, 04 Dec 2025 16:47:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE256C6048B;
	Thu,  4 Dec 2025 15:47:27 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07594C60469
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 15:47:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crtGApSMr6tuO3qbt5ikHr2GU9/PCFpZhjAD4iEiXW8ztAMeh6kFHEn5Fv7cq5GRT2sFI3Dvu1k2+os+kAaNi9ZLQ5IWfMZuyj4HVeZBoS6elTOeV/RrBQ0uJQWQU/IdyjXsaXZ39gHTl7M2F7lvL3Vm2au8aq1PmDQtlWzcpY4dvPzZpMW+mcJq0zyGMIciEpbbCiEaMj1IX9Do00t4I+qfP5Bakwe8KaVtpLo782zPSgL61rs1nH1pP89K6IdgwuRrQ5QzHtnp7RRRCeZ/h6FJcpZV3Torsg8BsQT++I2nj4Zkgm0LpG9UadYU37LJrAFxmx3rFSOngSzvKesJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=dK+eapdeC2UbpG3oLqzNMKh9IbWlsw1+Fbnvs55OiCLT6wmrerFIfk3P38ytMgde//SHlVUTkqwCJcyYHVolQDgkxDc+uDHVb8NVJjHq4CkBoRarNuE2J42aLd7c5YMS7h5j1qREoD66Fw/6adIvb3uVZ6RCi9PJvie+FHHdSxzKBznx/oM386j5stNdfpBPmuWGOpomfBdgdS4hcCksf6HTKmUhtlZUbhMHaXK9XWh+UyaQJ+SjpYTxDOFcpdkaUpHJqvy+jaQt51R+nC34uw+Ef7ihC+cO9IARjr4uiVDodtsEm1pDv7W4ibUTHAvI/ntBacrmp+MPFMZu+pdHbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggEx89gGdaO4mhwV4AZ3U6lL1OA3p+cP/XdIsKkIvQM=;
 b=GTZZ/0MhyL+TxXAG/NDApc6NzPPx+TwOSuQ/yzFPpDHAhBEmP2MK3JiCpwR4xAj+Z/E4rniHl/flgRxgXnrFjDm6DOXZ1yc8Wd/Ww5exs0TMLcsNdLRTyw3guqhl3GF++0RcVTrfVZEn28KQxJ2lpP5gobUnSqpRQnpbXYiJIyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB11453.eurprd04.prod.outlook.com (2603:10a6:102:4f4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 15:47:24 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:47:24 +0000
Message-ID: <4f8e991c-b93a-4e05-8937-d3741c2ac159@cherry.de>
Date: Thu, 4 Dec 2025 16:46:51 +0100
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114162417.4054006-1-patrice.chotard@foss.st.com>
 <20251114162417.4054006-5-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251114162417.4054006-5-patrice.chotard@foss.st.com>
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB11453:EE_
X-MS-Office365-Filtering-Correlation-Id: 862e8852-b822-40ef-4583-08de334c6b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzRhbjFUUHE2bW1ralNlWGhhQ2JnaUljNk95VzJ4VmNqNU9NaDdRZkFUbHhD?=
 =?utf-8?B?OHlJOEVoQ0tvVFhVYVB4a0FtalVvQXRLczRoOVQ0V2RYdXhDWStyb3hITzZv?=
 =?utf-8?B?QzNEWmVhN3FEVVlnb1cxRzZncys3bytqdk5WRmhPa3B1cEtxbVFHaGxJMGc4?=
 =?utf-8?B?a3g4S2N0b0FHL1dIR2wvekd2NFdhY21rVXB2R3MyUm5DM1ZzRTVrUS9rdXMz?=
 =?utf-8?B?UkJURG9QbEpqNXF2L2c0OXpkQlVrY1dDbW5LT0EzcW9wSkpnVDBTZzZDMWRh?=
 =?utf-8?B?UFJxRFpTUG1kck1EQnVhRlhkSmo5R0gvNUd6WjRXWWMyZHd1RDlndS9OTFRF?=
 =?utf-8?B?NmRNeXR6WlNXeks0QUlMSmpLQXNKNzlvb1g0RG0zbUxtVjA1NHI3czRPRkVR?=
 =?utf-8?B?OW9Xd2FabEpqQjlwdmdsSWp0VlpnVUpQRjczQmIwYW9DU0YvbG55V0hsRmhO?=
 =?utf-8?B?RVZTcENjZVNUVDVmUko4ZUdycEN6VVFzUkVQZkoraEFPTGF4T2t0bG44cHlz?=
 =?utf-8?B?blNFWjlGZ0Jsa1J6WU9OV2wxemM1NWJaMk9vUjdZL3c0YU9RTUxpZHpNemlM?=
 =?utf-8?B?ckh0YUdLZk1wYnV5UjBFMUJGYVNiTjJ6d2VZbTZOMmtSeUlHWC9wQzhWeVp4?=
 =?utf-8?B?Z05kNnNKMCtWQ2M0RzFBY0Vqa0JQcVFxYUZZbjkwRUVnTjNwN2loQlRGYS9l?=
 =?utf-8?B?SHBDM0J1ZmZmZEJaTFlHSStRWHYvYStTeEc3OENQQmx1Vk0wYmtCcnBRWnlV?=
 =?utf-8?B?aHpHT2NCNzlUWnd2U2lrVHcyb0w3UEtoT3VnV0lCQjMvWXY4VEVHdlNuVEhD?=
 =?utf-8?B?N3pMV1lDMUlJSE94Z1k2RkdLQVBlWTJKWWQzOE9CKzdMWnBWd2tUM1BBYVhz?=
 =?utf-8?B?eG5KR1Rjem1SY0tPWUkyaXlPVk53K295b1BhNStJamQwTkNtSEJKV0kxWFBw?=
 =?utf-8?B?dm5LaThTbmlFdXozalRZUTJKOUVRU2lXMkQwWk1rdXdmYlAwNlF2bmxFNzdZ?=
 =?utf-8?B?bm1aWURvaWtySzJXYjRwZjRVcmZaVFVPOHJ6UmhiczhLMndNNVdBWlJxVlNZ?=
 =?utf-8?B?Mjl2WjMwcFl6dGtWd2l3RUIySTVEaCtYSlVDdUVKSkhhQ2cxMlhkVlN6MFYr?=
 =?utf-8?B?ek0xOVZ0QW43aTNBTnE4U3h5MGpOMkRKWEJJYlJma1RNd0psTlNJazBGM05V?=
 =?utf-8?B?RFBiaTVMOTZNU04vS3BWOHVoUjhkTmFXcUlxemV4bnhtODRnL3pGMG5LWHEx?=
 =?utf-8?B?RHY2U2hCVDV6VUxCZE9sVlhCUC9qRGdKMmF4cDJiQjZKUXQwbER1bjRPVUFD?=
 =?utf-8?B?Wlh3QmllSFdMcUlLNURsdmJ6VkZnVlRLenNhUG9USS9SaloxMU5lcytXV3VQ?=
 =?utf-8?B?MFQ1M2JWRnM2MUsvL0VnSEJrbDM1VmtTU2FxbDM1OHRDeXNjUXFXY1Q3Wito?=
 =?utf-8?B?V2JKbzNkNUkvSml2MXFOVCtWOTlmN29QN1BJVThadGp6N1lZSUtGZzZsb1BS?=
 =?utf-8?B?eDgwWHJTOUJNNWdGdUdmejZFeDBsUE54b1dKU3NjRzFzM2RjOVQrZDNCSnM1?=
 =?utf-8?B?dVA5SVNQWjlsZVEyWkpFbXJkbjZkRUpNc2gzdW85QXIyZVVOemE5dmZ5a1Iz?=
 =?utf-8?B?NkxiSWN5Mm5ENkdhVFV0Wms4a2F1MCtjVnd1c21ITzRMWDNEWUd1RXpDam16?=
 =?utf-8?B?U0ZUaDZaMUN6aUN3Zkh4RjBybTRGeWZLNHc3K2pHcEdOeGo3VmkwK1JpcktB?=
 =?utf-8?B?MzhkQVB3bmZDbzdtTWhmcFZKUmZyeXF6Witkd3YrYlNvVk5XdmEvaFhBV1V4?=
 =?utf-8?B?QWo1MDBOT0dNTmhMZ001Ly96T3Z4elFmaERYQnRyZWt2aHRKdlJIY0pZNDN1?=
 =?utf-8?B?MHZDWGpxenV5WkRQRHpsUzhsQnQrdVRxK2lQbXR4ajgxREJFYkg0VVMyYyt4?=
 =?utf-8?Q?RB/3ZiaAweh4S0WwZtHjOH3Z04ZPjLrl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmJwOVhLUFRGOTZnL2VoUjJxNVBvMGQ0ZHhkZkh6L0NCdEVVK2Q2cW5VMjll?=
 =?utf-8?B?amJSU3o0T0taTmVQL2w2TGxEdVhmMWpVRFdrVUJNaTBzazQvMlRIV0hZR1pV?=
 =?utf-8?B?Q1RBWWtrUlFzb0hkOEFtM25QYmlXWG1mN2N6Mmd3Y1MyMFJzRWVRV0prUWto?=
 =?utf-8?B?ZmFtY2xERXhEUTE3blZpZ3F3M1FBcXpWeVVXY1pycUZsOXViemlhU2hLQUYv?=
 =?utf-8?B?QWtaQmVRU004VEhuZXNMaVR6WHdGeW80WmVremFqVmJ0MHpLRVluMmxEQjVK?=
 =?utf-8?B?d212Q0gyY0IrbUZ1T2oyRGVmN0hGVkx0UkVZa2NUVWRYc3BhYkQrSHpQNjdB?=
 =?utf-8?B?L3AxcHJyZmxoRTBHbnFwYW1LdkJwRGRkWUx0QXJSRXp1akFJbkRCY003OGIz?=
 =?utf-8?B?RXdmbXVFOGYwblp4TjkrT21mUENxa2U3OVFFZGJPaFJUeHJLejRBOTdrSnQv?=
 =?utf-8?B?MjkxajhDbU8vOGU2SlF1ZEZSOXBHdmhNelV1TXNpektzVlJwZnNUUHRzTGZ1?=
 =?utf-8?B?bXNIVy9iK2lGVjVyeTF6WjN2Ni9QS2dLdFkyRnIwTWxwSzZwL0JVbmwwSEU1?=
 =?utf-8?B?cjc4bXFiNHBJckZWMVFzUnhJcDZvbEFHdE5JQ0RHWW1JTExRWWl5eVltcWVN?=
 =?utf-8?B?cHdPUExZUTVXNzEvM09NQ0hpYWxaSWlpNHFHRHV3RDN4eEd3VVUrSXZNWkxj?=
 =?utf-8?B?VkVFTVplZk1PNXFhS3ZUTU10YU53cTk5bE14WnFIdkVZQkVUUURaKzhOcHdF?=
 =?utf-8?B?ZzF1bFhESTJoeENVOUFkb2Y2Um9LK0NiOFJjSU9iOUI5ZkljNGRaTXY1VWhk?=
 =?utf-8?B?aWU5cXBpQWNZUUdaVVRCVUlZU3BXa0x1WWRrYlRLVFdpaVBWaFdiY2VDRDZu?=
 =?utf-8?B?NS9nWjJtUHRrMXNEWEUzMTNOdUFuWG9WbndwZ2pXais4S2ZTa200Mmp2M2dH?=
 =?utf-8?B?bWRMM1doYW9vclFJaFZMR0htemE4ZVZ4YVNaS3pDWlJoalJWSjlGNGNiL21w?=
 =?utf-8?B?SkJ3MDF1czg4azBUYU51VGI4QmtNUGhyUnRrT0k3dFlRb01zWUoxZ3YzNWF3?=
 =?utf-8?B?ZzJEWUlmYXE1SDFESmdvcm9XWVJ3b0NhekNTK01pUFVwRStXTDNDYzdsa3U1?=
 =?utf-8?B?VW84di8yUU5UQThFZnhVbzQrT0hudVkyeWtyQ2l4TE4xZktJY0pBVjg5WVcv?=
 =?utf-8?B?WjNRaVE0WFRiVDZFSXFVMjk0dXNlR0ZXUVc2R05SbHJSQitmY0JESVJvWVND?=
 =?utf-8?B?OU04WVRtTlpvREkyb0Ftai9YK2x2bmRWejZCeGlnTmMrVEl5U3hVTGVIeDdQ?=
 =?utf-8?B?ckhIa00zRDJoMENZUkhiaVphcG1KdDVSbTBUc25IN0FmczJlVlhDVGovTlhl?=
 =?utf-8?B?bVk1Zitxa3pJNlBzTmd0THVWNUM5VXpDM3FLb2tKSVV6dFBPNUd1Tnp2MU1X?=
 =?utf-8?B?MjdmRnRzWHBuY1haNTlYM0NpZlVYVkk3Vi9aQ0YyZXduWkJqNVVRYVB1ZFlx?=
 =?utf-8?B?YlRXQlZ5MFBQSTJ6S1BuSWFYMUdpWXpMTXY2QS84Y0FjUHRlMlJWcmFPMXBi?=
 =?utf-8?B?aXVhV1BHU2sxOW9yWE5POXZvQWVtZTcvWk5tUWlyaUdwSytpRnFZekNDRy9w?=
 =?utf-8?B?WHBZYkM4K2ltNHFJYnpIYzZqbzNnSW45ZWRBR1E1QkdPUVJwcDVhVS90OG1O?=
 =?utf-8?B?Ty94UldMOXJWT3VVdHFZSjNMN1BxYk9zSW5KRDVHSG13Tm5jckdwRGFOd2x1?=
 =?utf-8?B?Z016OGVQT3FXaGh4Zm5JbE9zMkhxWkxRVy9nMU51R05TUk0rRHlQMnQzZUtu?=
 =?utf-8?B?OE9rWFlQZ1ZVZFRlZTBUbnB3SmxRSjVNOC81dDQ2N0dMRFRaMHhmaDI3bFIv?=
 =?utf-8?B?dG44dVMyQ0xDNFlrZnpDTkplZkV2Zll3cWp6eHROWCsyanF5Z1lTMWlTVEFY?=
 =?utf-8?B?UG0vQVFQWDlhS1I0b0xOaUxvbE9nOWJ6YVFnRCtVNXNaVFVvYzNQQ3NwRTVr?=
 =?utf-8?B?V3BwMHB1Y0JNQmFsTiswVER2UklaQk1tSW0xUStKNUx4blE0Z1UrcXRENWpy?=
 =?utf-8?B?WUh2RUkwNVlSb1JKN2xXeWVzdkgvWmtnK3pGQWZRUjhGSkxKOU5oNFNTUmp5?=
 =?utf-8?B?TGZoZHgrYjl1TUVha1pmSitkZHFpd1dmUk50d2VVSUNsZzNVdjUvblRhcGlz?=
 =?utf-8?Q?UNvoQiJg7yWQ3Shj+K6wJr8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 862e8852-b822-40ef-4583-08de334c6b14
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:47:24.1520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwk4cQZeIB0AHEG1pdjcgdqj5S+2Il7GMTkcofIGciq/+6O/oknSPav/n1b5IkHq3hYMwjomOADZyaPJOHK8tN28boIr0JydvTPZDVOCHVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11453
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 04/23] configs: stm32: Enable LED config
 flags for stm32f429-disco
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
> Enable LED, LED_BOOT and LED_GPIO flags.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
