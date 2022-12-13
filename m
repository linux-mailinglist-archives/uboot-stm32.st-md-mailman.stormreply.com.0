Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C17C64B1C7
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Dec 2022 10:03:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 025D3C65E61;
	Tue, 13 Dec 2022 09:03:25 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46D46C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 09:03:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3rTjTbzka/MNjz51twaOtyL8QLabIfjUnUg7vx4ti2tyUKjcZJypbedtCNaYbqwYlKqZLKm9sDcsA99VBaJq4i930OTBXZhuzzFpGtcS9lo2tTr2LJbncRQJLIS1+VRzI9NDs/ZrdezUKQr9bAVVufmyphkb+aeJAr2XRQ2CJJxliBOx9hfxfESMr8l8LRBZBnfbRudoqqAFRDLl2Vtk3SKeEyjWP8XMwqSeuxGtT7dE07c3t9pnqi0ckOgck2V0cnYDvKuznh/R9TntzzD2wI2V1YYVU5Un37ol4KnBjm/ZTvv8zUDO9JlDgSxa8kXAVo2lTHNX5zCfx1QVdrOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rjbjg9+pTKzf80n8421V1d99v/sE9nH83f7La5c2LvI=;
 b=VoRU9PLDpqNUpRyTilOL5oPSo8Zwg315NvILbPdCJeTxF+uD7Mya4D0F56MPQ+YAX8qiNEQy9c4fnZGAssC/7GPvZOGkMxzXPUwxwB/Ky5KJ0z95e14yd+82Z1KU0VmtvEoJDkJavgxLGJwGHG9yT/5JecqidHeEx6CKtQ8HulSLdA+LrYFq9DB7KoDPsyBXxXOalUyRrS45y/Wos5WiBoKH6wvYZuBd7vLO2viVeZx5fhFkiWBOlhA9gH3pyBCIux0DWMWdHHaDPriKedi9NN4Up0abpq6/1YLj6TFP5zdOR0z+Nx69q0n43RYU7kVNmn/0cemyvOqecADLEwytPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rjbjg9+pTKzf80n8421V1d99v/sE9nH83f7La5c2LvI=;
 b=ZGnvKGwfwW6QaYAlnkltVvY0TgTsVrLu12wbBIVaR17S5YplxhSheIjE+8vgJZvrRYEkVxvq+tKiD0m2ImY0580zgKhBiP1WK9nHEPlCooVda3lAW/gczzmNjUV2SLRsdA+PqS5I+AEYE8mHwdgm2vD6lWJkSy2k5ycKKHiq16MqKrCaqw9WFP/DcIx1QK6Nxshy4pmQUnyVOAQNp56qiecJkQHot/LB+ta5szx9MLNwBP+gA745ZqBYQ+c9n5uES8vqQavIZs2luG7z3GJOl3bOEhGT+7w9+rg3C3+FHigWvYSdyujsIINMMmtWJYpsfcUp2EPN+PAQZu1eP1xPHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7882.eurprd04.prod.outlook.com (2603:10a6:10:1e7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Tue, 13 Dec
 2022 09:03:21 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%7]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 09:03:21 +0000
Message-ID: <128fd7ee-057f-469b-adc8-35ba9e6f62f3@theobroma-systems.com>
Date: Tue, 13 Dec 2022 10:03:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <20221028110055.3.I4bb4d81ec61fcc6340db1f81d5504905a22e90af@changeid>
 <20221212213458.GG3787616@bill-the-cat>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221212213458.GG3787616@bill-the-cat>
X-ClientProxiedBy: VI1PR09CA0047.eurprd09.prod.outlook.com
 (2603:10a6:802:28::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e4af5a-de5f-4ca6-c4f9-08dadce8e23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Na+8NzVtC0RfBaQdNhTsgLU+SDJBYcRt2mD9LrSvejJdJ8e2YH/syUgAAGwoOUtaBrgDXzK3sJeIigTDeyl9rqugKfz7FRDhLDTfF9Qc06vFadrpXo0Xfr3/efciQqX3h+x/rxzTXVfDoHhxh/jDJTOgm4LuLxWSMOdYKx9FEkgi16LViM8uGc5+kfchiVpJLnRSN4K6bWhQJ49Zt/NJ1KYDYd9u+rMffLVVbQQwzhTgb6W7GRvbQoInqgA6bCYktNkX4ZLzyQk1UkkBd+SJuMplxt2hYk1gJKoJrdGt3PR5QBko48Knu8Pz6mcPNdgQVN1cDirUsn4blxHQuyx5GsUdnG/U91QYJUQ/mS+fDdWcTMDHGS+PQfn4YorqUCcqzbd0bIPWa5y50e+vQNlsOQAftTU3o7yMjSdRBUMYuEDqWajyalYqtqSgPl0fhtzq9cOBPqnx2VgoPqYQAPIT+Xs+PMu/TwFeehQ1bv2ybIp21Bg0gUbIkkk+U/jRF5F9tkTJmR1DgE04Cz8fWJy8dX22xJDWYLsif1Z7DFsPfdiIsh/F+OsyHBvR6vXE1CIgZ+f4BRR1wNB9LOZShJ1yOfU1oqiCuppwu1tActJMQn2O6WXoLlR0Ot0ZbGnoWGhte50G4zHHomIQDqzFaeyPKDHW2IE3E9ZGHOx/tVFTLvNg8JGOS6Ibfpu87LQKqef2Ppb1JvTeBB/loqotNtDdQJeHr8wk59YMUnCYDshIOT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39850400004)(451199015)(31686004)(2616005)(31696002)(6512007)(86362001)(54906003)(478600001)(110136005)(316002)(36756003)(6506007)(53546011)(6666004)(38100700002)(186003)(7416002)(2906002)(44832011)(4744005)(6486002)(41300700001)(8936002)(66946007)(8676002)(66476007)(5660300002)(66556008)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWZyY05wQ3d3QVJ4R3RxdjZzTDdOcHRrT3BEbFV1THAvcUMySGRRRS9aVVBH?=
 =?utf-8?B?N21IK2FIT1lpUEJNSlpOdFRSdU5JM1Q1WkRMWm1NeGh4aDdvQXVHYXpJeUl3?=
 =?utf-8?B?aXVrYTluNzNDeGh5L08wR01RWEh3TEJTdWd3RElFNEJlbVoxc1BGT21TL2JE?=
 =?utf-8?B?bzJNYzIxWCtnaHp4UTVKd21ITnlFRG1pcWxnbnNVZmNvY0VSUFV1ZjBYd2VK?=
 =?utf-8?B?S3ZSRWR6cVpOUThmMVRsbWtKY2ZKdnBkUnM0cnJPWFpvSnJocVIyV29ZV01w?=
 =?utf-8?B?UVArYlZqb2g2UThWSGVUcXl2cU43ZkwrcjBiaVlocDNKY25vbVpGOXpVelRj?=
 =?utf-8?B?elhyc3FPSHlxc1NxRTlITEQ2Y0pBV2tiYy9tNGoyMzZVdC9XblBZSFhybWJ4?=
 =?utf-8?B?dzR1QmEvczA2ZEpFRFZscU51eXVkYUpnK1pYMncvWHRkRXB4bUtwZ0RWWkxX?=
 =?utf-8?B?SVY5NXVHMXNhVFYzSnYxR2dyS0EzLzZ5MUtJSVdqdUZXYVljTjJLRHAvZXRB?=
 =?utf-8?B?WXJtZU9xWHhCejhQVit6Y3drL2FrVVFFN3dGRFhlVTRNOEVOeGVpb1N4b2lk?=
 =?utf-8?B?cVJFUDhUeTlURk9SOEhBZ0o0UGtjbFl2N1NMYmUxOGtQWDFwVDMzSU9oa1Ix?=
 =?utf-8?B?aGhKZTBsaGZ0SEFXdDRuRlljM3JKTnF3clBteEN0WDRvbzYzbUlWOUVNQmtV?=
 =?utf-8?B?M1d5QVIremJvYTFsNUVyU1ZLWUhRSFZzcGMrN1d1K2o3OFVPVitidzFOMWdk?=
 =?utf-8?B?YjlEekgxRTVDcjFLR0hLMzZKZjBBR3NRVXB0N3FURVYyWVByekF5TW1OcEYx?=
 =?utf-8?B?N01ONDRBNktjMml3M3ZwaFkxQ2FQaXBVTWdLS0wrOGFyaGZmZW5OdVpEVWtu?=
 =?utf-8?B?ZVhxYVlLb2ZpNzFBY2lxUTFWOG95c1hybHJySE0yTkFPRkxwUHVjWk1UcHQ5?=
 =?utf-8?B?R2ZWN29pMlZBRE9FdjNtWWNpTkhCNGtZemxOZkU5ZXBIQ1QydExkVERiYzFl?=
 =?utf-8?B?cSs2Ny85TnZVd2hUWDdPQmUxYjRMc1dTaUVmeEJ0TWpXamxPaFI1MVdhekxn?=
 =?utf-8?B?ZVRDOWpnVG5TUXhpWS9VSTRja2txNEI3TEtqTTcvaHBkUmxoSnNKS3cyQnRB?=
 =?utf-8?B?bUh4RjhlOUwvQWlEWHFDSW1GZHdOUlpWN1RyTVBjOEtodUE1YjFxMVNaajZB?=
 =?utf-8?B?VVl0bWNOVnR1S052TEVVMjM0VHplOHloamE4ek8ybDBkSlB2bEFUY0RhYzhq?=
 =?utf-8?B?TDJta05iaGViSHRRN3RiWlpWUFNMejQxTnFSRWhOemhoeWhZSWFJcHpRSUx1?=
 =?utf-8?B?Vmxua1c3MDhpaEt4ekg5SXR3UmUvVjBEckZCQmJ5dmhaTU5DZ1k2MmlYUEly?=
 =?utf-8?B?VzQzZ01FM201ZVdaTzdrZlcwL1F2bG1kc0ZyZE5DQmdtVURob1NMV3laVnNp?=
 =?utf-8?B?blpnSXVWQkRmMmppRitXRzNZcHNiRWoySllpa210eXBxWSs2bjFSR1V0ZHc5?=
 =?utf-8?B?NzJMK3U4Z0xyUXdBQm9zZlhTSlBDYmc4dE11ZFFobVZyTDZvYnE3NGt5YVNy?=
 =?utf-8?B?TmM5d280Lzh5WmRSTjAyY0Fia0NmK1FFTENIY3c3b29vM1dGOXZrMzVPZWt2?=
 =?utf-8?B?RkNUS0JiRHBRcmQ0MzB0Vnk4VWxrbnJjWCtRRDNCRHV1R1M3RnVpOWRtbGFz?=
 =?utf-8?B?K3l6d2lqQW9na0xRdWszSmJYVU9WU3NFTU9vSlp4VHAzOHZJZnl3Uld4cDkv?=
 =?utf-8?B?SWFnTG9saVdBZG9xVXVzMzFWbS8xNGM5SU8xVW9QOHZKdXErQnhBd1p3ZFJ3?=
 =?utf-8?B?eTFGR3NOZjdQTHljTC9FWTVtdDAraWpJSVNPNkhoaHdBck8zMU9udWN5WmRs?=
 =?utf-8?B?T2syemhHbFErbmMxZVdWSVQwS0RFbWpGcm9kNFRTbCs5TzNXclE2a1BuQjAr?=
 =?utf-8?B?Ym1zSWNSd2ZLUGRyVGM3T3dWcGUzK2d4SlcxOTJEaUxEWkVlUVBpKzRIeXZE?=
 =?utf-8?B?L29neXIrQ1MzTFNTaGxXSUtnWC92WSt0YU0raG1xM3hERVQ2eERpbkJBWHNa?=
 =?utf-8?B?NTljZStvUzIzQW1LOS9reC9zcHUxR1JuR2l2ZFIzYlNwQ0kyTjkxcW5sRjE4?=
 =?utf-8?B?NnVyRk5lZThKdVErR3N3dmRWNVZQVmdEUWhZdVQrZ3p6NU01Tno1ZXppc1FS?=
 =?utf-8?B?SUJPNzIvRDAwSnNoc3BSTm1mcU02M2xQTTluZFZ1TnpOR1ZrY09CK1gzRTF6?=
 =?utf-8?B?S2MvT2ZtbWxhNEpmR2doZ1NGVC9BPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e4af5a-de5f-4ca6-c4f9-08dadce8e23d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 09:03:21.7255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9anGQl0lFOMAiRGixhHCP0U9GKFNoLXyNsHz615sEgn0YaakSeoSD7V6dhfBGOn0Lu2Wesfw3QR0TijlR6OheZfhq52emCi0VSJmb08IAm+2LdW/1D3NXxUAiS0FeP07
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7882
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 u-boot@lists.denx.de, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 3/3] cmd: pxe: use strdup to copy config
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

Hi Tom,

On 12/12/22 22:34, Tom Rini wrote:
> On Fri, Oct 28, 2022 at 11:01:20AM +0200, Patrick Delaunay wrote:
> 
>> Replace malloc and strcpy by strdup in
>> function parse_label_kernel.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Applied to u-boot/next, thanks!
> 

I believe this was a mistake?

This introduces a pretty bad regression as existing extlinux.conf won't 
boot anymore. Distros will need to have different extlinux depending on 
which U-Boot version is running on the system.

Was the merge done with this information in mind?

Cheers,
Quentin

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
