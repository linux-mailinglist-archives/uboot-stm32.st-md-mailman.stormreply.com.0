Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F065C3EF
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 17:32:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4318DC65048;
	Tue,  3 Jan 2023 16:32:43 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F98FC03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 16:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mae1GEkmNThzexP8N2UmPEgKxvr3MSTYN5WffvRflxIu4ytDfEW0nVLv+NO2pfZh54BIVgsliJzGbcEgIs2qlreewoWvxhuTMR+C9Xn3cu+Byrugf1VTPmwqnB9vdvyOx1pU+7Sogoi1L8TvJfVkItt+WrtvZUE7Rsk1AHN6pMmDbjwTr8YcstaKBub+UzjAtojWEnzSB51phw0DH62HtISVJg3FRjtDNjlo37TEO2BgjYJ31PnAEE/s94l03KLXUaxBOZAHknDmn+NDRQJXrWxugfFwQimLaA7cTCt9DMZooT3ivyN/xUO2yC80s2eOC+6V9Dffu0ghcYoYoe4lFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SStsxqoL9SpMOmU4B8IMmjJNbiyv35S/ysSUZLjJzfE=;
 b=XpHT3XI1n3OKk3kmt4job3fTpgNs0uYltcDqAsiQ9NMyxC/1OYPigBRuSjjz97ygArhHs4bVH236bu8/YclxqGokVIUL9wUSHGN4fa2Qba9endN3XLvCyK1BCB4A/d97Ii/+qAshRE8Z8WSB03gyuzi9nqR+XoZQ+G9ZKhdYmbSQCeEjQnhWBGMsN59eOZDTVc3HXusum7uEDNud0ebrSrGsQvBZeujsa1dFr9/pcztCGlx1HBBN6DkRL+SsIbUFubDlM5DSxaQjMqyWsLXAoTjXFuwyDATOtphPZmJI5cjL779e3wOIVDxIq7fi+U5xDNvZrJ4QzZDrfFyvsdF9EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SStsxqoL9SpMOmU4B8IMmjJNbiyv35S/ysSUZLjJzfE=;
 b=J1EdafzBkbwVOHV8E7EnqZ9lWUUfyVSaB+BtMJbmjSHFn6DmOZJRYOyrHx24/JxI2PSn1PZWKAILDtLZNK5c5WKiB5ZTs3Ljw5qcZFyrh5BjS9/lB2Z8f01nTdPuHRNjlk8YXMXmz3su71szeGRtoBclOwfaap8eM13A0mqoOBGatbJHsuNGiIhT5BV5tSNCEU0NNOG6QbXJnpyqPyPyHA8f1dNWnrxKFoA0x7VFVOqDauRcufNS7iNnkVsG72aJMI9LyX8E0XPRVfGzndHdC753sNsT5VW5zVcykakhzPxtSMEwpO8HajtCmfstRJBmy5nqcscJv2VBfUgpd2fECA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 16:32:40 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 16:32:40 +0000
Message-ID: <8b8c936b-b4bb-8902-6006-31cc54477f9f@theobroma-systems.com>
Date: Tue, 3 Jan 2023 17:32:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 neil.armstrong@linaro.org, u-boot@lists.denx.de
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <b7e891d1-d134-b489-eb2d-6125d4c7b6c6@theobroma-systems.com>
 <5f67e057-c41a-d4a0-b199-5840ae771e35@linaro.org>
 <f0dd213c-4a34-926d-3f3b-f2ed49bb92c3@linaro.org>
 <5ce0e4ad-b015-3487-614c-a60099dbede9@foss.st.com>
 <9f0641d9-b5f6-ed05-1563-ae96ca873052@linaro.org>
 <90a47202-6f6b-e8e7-521c-9df6a5730a5b@theobroma-systems.com>
 <71bbd180-331f-8d7a-46a4-7bfe6703a3eb@foss.st.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <71bbd180-331f-8d7a-46a4-7bfe6703a3eb@foss.st.com>
X-ClientProxiedBy: VI1PR09CA0150.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::34) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PR3PR04MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ac107b-01a9-43a8-392b-08daeda821a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mjv7hFWglHGfRJ0lk/3j8BaFH1nqWrgd/XLdU5ED1fZi5AyZ2GFbXMQgwogcZzF6WY4yvgB7oDtBFGGsCRi3HRbpI21yiUrViVXhR8Bxgo2OQlwUbqw+6HRZszF47FUBZVf2LHWlWlOf2LlZrZYnmNbcAQk/hrj7qTrPFAdmlJKMyOtiXehz/8awY/cKcVbVSi8n7auxE1UMRA/1SnZCmH1P418nsBWYRbvJSH5Qdv/SOHFudp8Ivu5+btpDBv1wmf+YhRUOnfEJcByMf2KlnqAk5Kbhz06OMYwZSC1FvxCcsNPvu9xRliLDhe1oJ8/rEbMhiUQuVOqg4CDiLRAN42avBrucXP7psDTpWn8ZDD6KtZmS3bU4YJeTKC/xrlItSHTAhCqqkzHD5yJ8JcCoFQ159nRbhP9AV2ydcsVu5DfHPmYAhglZ7SyD0TG9ln//IlQ1qAoKgzcC7V+EopzB+qNd8d+rRI7FfeHCB268TFLJUoVkhUuWxX6xy4UGrdqi8hY73rWDTyA02B01Mad4xyLNNP4hpPvbZJVHCvbgqumHF8bLMXLkYqQp9ZZQfBZxeVVSpeDlRi6tcWetPnznfIGNirmE45gEitUqHylL/FOSp6TRBOlebhdAChPao+Me/25hAJI2bENN7L2i0yJ5O1jx0roak7+aLf3UPh2FVQwdoCxD0E3T/Qr4xrDjh6ZfwSPFsIpZo8NLqZ86cW/uskMppxkGZssWFmRHpZm68YH/gzgcsEC5pWkls08iMv4P1rP76QeWHPplKnL5pPBXjY8ObWu2danE1+M0GRSjADFQvD7tC/cwNttPNM6CDS3D7hclJLiplLvbeUwbK3VS5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(346002)(396003)(39850400004)(376002)(451199015)(31686004)(36756003)(4326008)(66946007)(66556008)(66476007)(8676002)(2906002)(5660300002)(7416002)(44832011)(38100700002)(83380400001)(86362001)(31696002)(478600001)(316002)(54906003)(6486002)(966005)(2616005)(41300700001)(8936002)(6666004)(53546011)(6512007)(6506007)(186003)(22166006)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW5sMXB4UmVLK2FNeDdkeDg5RUtiaXRBLzZFT2NoTVF1TTZYMTV4NzRiblNy?=
 =?utf-8?B?dVFDQ3lPOFhzMlUzdmhDR09mVHQxbkVrTGVSaGl2d1JqclFDVHNRWmdVWHhM?=
 =?utf-8?B?WWUzdS9GVWJLSmh4b3NMZGRQdWVLdkUvNXhReldHaGxudzJTQzB6azlRcmo2?=
 =?utf-8?B?RGNlUkxMZEUvaGViaVl6UzJJSTZTMVJ4YWVFK3NXL3lTM3dVSlE3TXNjYVkr?=
 =?utf-8?B?RFY2aWthMlYvT292MjN2QVhHZmt0WVlBUTV4Y2NZd05Jczh5ZlBLY3NmMzVG?=
 =?utf-8?B?NmpqZ09pM2JnWEx4RklYWGVxb0ZBNGtMVGtHcUlmVFBEZUwvbnkyZ2I2Njl3?=
 =?utf-8?B?NUhRR04vZW5iYmFla2pDeHBCWTF2bk5qUERNL1d6bS96NlBQcCtueWIwZGZ6?=
 =?utf-8?B?eFc3Q0JodElZNzAreUhPMWtxNnFGSVBDbktVYlltSW1rT1hJZ3lOK0pWZHhF?=
 =?utf-8?B?ZGwyRm1ZeWtsUzJxV3pSNEJWZWM2dmx1VnlPT3pZNjJFdlNVQmk1R0RKVmJt?=
 =?utf-8?B?bnhTandzdzNpSmQraXRBOFg0NVFxencyZWRUK3BhQ0pnT2hnWm5rZ0loYWZz?=
 =?utf-8?B?ZDZPMVpRZjk0WmRBMEFabTg4MlNYY0dCZVo3MGVTTkpmdjRHaWZsMTE5eEl1?=
 =?utf-8?B?dVpHY05saVRHWU8vMDhkcVdTcWM1UFhINXAzMFhybDJIWUJEaUJoZ0xxQ0R0?=
 =?utf-8?B?RGtKZGc5dkRJdDFoaTF1SzlTSXREM2RKRkpReWZ2NWI3dnJ6MVN4emNBcFNF?=
 =?utf-8?B?bVl4Zk5PR1RwSHdkNHdka1piRmJHZWhCcjJlUHBDTVgvdUw0L1BLamVSVmRs?=
 =?utf-8?B?Z2dUUy9qRGdXdHJadmpNVWpnOGlyMyt5YkU5VlRXRm9yZC9TZ29YSmE2S0hp?=
 =?utf-8?B?eXI4VnFWUENyckZRd0M5c2o5YllYdFhVclpDeVhSbmNCeEhRb1YzS2F2Z0Yv?=
 =?utf-8?B?aG9jWnNCWDVJNmZGYXhPM1l4aURyNERKU3o3Ri9zcGtYdGMyeUkxR2NNMzkv?=
 =?utf-8?B?SmRwR0JRR242akkwUnFHN0MzUmFtdFZrK1dML1NQUjBFTzYrVXNNSHZkcU9N?=
 =?utf-8?B?WU5uRHFJS29SMDVpbXV4NzZxSWlHSjQ0RmhuYUd0U1BlWWNOamU5eGQxZFVk?=
 =?utf-8?B?bE43RkU4T3J6ekRtakhjZFZOaEQ5Z3FZUDV0WVRtNTFvdnBOdkZWNnBKa0lt?=
 =?utf-8?B?YzU1aWVCOEU1QWt4Ykh2ZmR2a2hjV2I5Zk1QeFBnQnY0UlIvUUZrc2VUM0Mv?=
 =?utf-8?B?cHNxbEdkQUFBSWZSallsaTlaL3M0UnAzQUdRNFh0RmQzckl0K0tPMTA3VDZX?=
 =?utf-8?B?bUwwbEVVNmRUWFVtMUk0L21nb1VnWE1oU1JWZFZxRkRuV1NXb2RwWTh6cW91?=
 =?utf-8?B?N0hoVEgzOHJ1UHBwM05kanpIT1kyU0RReFJ4ZHh2ZC9SK1JsdEIwaU9DaHFR?=
 =?utf-8?B?S2xUYy9JRDI3OWQrREdBYXNjYm1kenVVS0x6NG9WSmxLSDRXa2poK3ZELy83?=
 =?utf-8?B?Z2lHRGdhL2VKRjhFNE0rVGZTRVNROXJYV2JZWGNjcVBKSjlSOXB4SVZmNWlM?=
 =?utf-8?B?SVFTVWJJYmtXWjU1bUliME53UFZialIrM1d2T2c5L3gyaFFXUHZ1RzVuV3Rj?=
 =?utf-8?B?aWgvL0ZlNkEwVjZSbmllWW5wV2RpZ3hVa0xTWDFLMDZiejZCamljbjJ6dTg5?=
 =?utf-8?B?bVI0WHZ3dVJuZkZ2Tll2NjNCYVUycitaY0gvbGJRdEo2KzlTalJFTllNNTFS?=
 =?utf-8?B?UUU2VnpXQkR0NnBhSkpJZ2t5SEZEeXRaTDMwSkZsQXlYRU1yL3ZhSEwwVHp4?=
 =?utf-8?B?VzRjUWVRbWpGM0RRTjh0MjdIdHk0dG5TOTFMcFF1QytpbGx4MGIxQ2RyWlVq?=
 =?utf-8?B?YWFIUlRCRXljNXpaOGhkM3FwQjZ6NjNQS1BQRHR3OVRLOWlqSXNWaElzbkZm?=
 =?utf-8?B?ZmlKZzg3Y3BEK3Q4ODNzSjFFT2R1aWJja25SK2kxSmRPY3c3QmdpRmFLVTUz?=
 =?utf-8?B?ZFpjQlAwNDRnaGV1ZzZZSG1BMVo5ZTJoakhITkRPbUppQW1iR2VjRlBFQ1Mx?=
 =?utf-8?B?K3QwZHkzVk9lRlpGckdiTk0xeDVKZGlEVUpmelE0QlpZRzVwWmVlK0s5M0R2?=
 =?utf-8?B?NW1CSnVpM21Sakx0QUpueTIrRTFPNWxZYXo0aGZUR2dlaDBsNHdIYUZpVlAv?=
 =?utf-8?B?aDEyTzcvWGVzQ1MyUmpiTm5RcGZIbDA4R3MyaEVHcFlEL0Z5YjJVY2RDZjY1?=
 =?utf-8?B?ZThXSnpJcUp1Tk1zNU5xbktxWmNBPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ac107b-01a9-43a8-392b-08daeda821a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 16:32:40.4598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5JQF8QRMHT23bX90ycYRf+M+tRRo/3SOPl5i38gVrI6HPw+WDeQbCcjBb1OSFI867ju+2914YXAzztzO9Of5Wg2vUZoSc7M5le9cZrt8+CIcQOtPgVSLZiyT0yaJrG/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339
Cc: Edoardo Tomelleri <e.tomell@gmail.com>, Peter Hoyes <Peter.Hoyes@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Zhang Ning <zhangn1985@qq.com>, Zhaofeng Li <hello@zhaofeng.li>,
 Ramon Fried <rfried.dev@gmail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 0/3] cmd: pxe: support INITRD and FDT
	selection with FIT
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUGF0cmljaywKCk9uIDEvMy8yMyAxNzoxMCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiAK
PiBPbiAxMi8xMy8yMiAxNTo0OCwgUXVlbnRpbiBTY2h1bHogd3JvdGU6Cj4+IEhpIFBhdHJpY2ss
Cj4+Cj4+IE9uIDEyLzEzLzIyIDE1OjM0LCBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnIHdyb3Rl
Ogo+Pj4gT24gMTMvMTIvMjAyMiAxNTozMSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4+PiBI
aSwKPj4+Pgo+Pj4+IE9uIDExLzIyLzIyIDIwOjQzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+
Pj4gT24gMjIvMTEvMjAyMiAyMDoxMSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+PiBIaSwK
Pj4+Pj4+Cj4+Pj4+PiBPbiAyMS8xMS8yMDIyIDEzOjIzLCBRdWVudGluIFNjaHVseiB3cm90ZToK
Pj4+Pj4+PiBIaSBQYXRyaWNrLAo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhhbmtzIGZvciBsb29raW5nIGF0
IGl0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMTAvMjgvMjIgMTE6MDEsIFBhdHJpY2sgRGVsYXVuYXkg
d3JvdGU6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNpbmNlIHRoZSBjb21taXQgZDViYTYxODhkZmJmICgi
Y21kOiBweGVfdXRpbHM6IENoZWNrIAo+Pj4+Pj4+PiBmZHRjb250cm9sYWRkcgo+Pj4+Pj4+PiBp
biBsYWJlbF9ib290IikgdGhlIEZEVCBvciB0aGUgRkRURElSIGxhYmVsIGlzIHJlcXVpcmVkIGlu
IAo+Pj4+Pj4+PiBleHRsaW51eC5jb25mCj4+Pj4+Pj4+IGFuZCB0aGUgZmFsbGJhY2sgZG9uZSBi
eSBib290bSBjb21tYW5kIHdoZW4gb25seSB0aGUgZGV2aWNlIHRyZWUgCj4+Pj4+Pj4+IGlzIHBy
ZXNlbnQKPj4+Pj4+Pj4gaW4gdGhpcyBjb21tYW5kIHBhcmFtZXRlcnMgaXMgbm8gbW9yZSBwZXJm
b3JtZWQgd2hlbiBGSVQgaXMgdXNlZCAKPj4+Pj4+Pj4gZm9yCj4+Pj4+Pj4+IGtlcm5lbC4KPj4+
Pj4+Pj4KPj4+Pj4+Pj4gVGhlIG5leHQgZmlsZSAiZXh0bGludXguY29uZiIgbm8gbW9yZSBzZWxl
Y3RzIHRoZSBkZXZpY2UgdHJlZSBpbiAKPj4+Pj4+Pj4gRklUCj4+Pj4+Pj4+IGJ1dCB1c2UgdGhl
IHB4ZSBmYWxsYmFjayB3aXRoIHRoZSBkZXZpY2UgdHJlZSBvZiBVLUJvb3QuCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IG1lbnUgdGl0bGUgU2VsZWN0IHRoZSBib290IG1vZGUKPj4+Pj4+Pj4gREVGQVVMVCB0
ZXN0Cj4+Pj4+Pj4+IExBQkVMIHRlc3QKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBLRVJORUwg
L2ZpdEltYWdlCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgc2VyaWUgcmVzdG9yZXMgdGhlIHBvc3Np
YmlsaXR5IHRvIHVzZSBhIEZJVCBpbiBleHRsaW51eC5jb25mCj4+Pj4+Pj4+IGJ5IHVzaW5nIEZE
VCBsYWJlbCB3aXRoIHRoZSBzYW1lIHN0cmluZy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gbWVudSB0aXRs
ZSBTZWxlY3QgdGhlIGJvb3QgbW9kZQo+Pj4+Pj4+PiBERUZBVUxUIHRlc3QKPj4+Pj4+Pj4gTEFC
RUwgdGVzdAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0SW1hZ2UKPj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoCBGRFQgL2ZpdEltYWdlCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGV2ZW4g
d2hlbiBhIHNwZWNpZmljIEZJVCBjb25maWcgaXMgdXNlZDoKPj4+Pj4+Pj4KPj4+Pj4+Pj4gbWVu
dSB0aXRsZSBTZWxlY3QgdGhlIGJvb3QgbW9kZQo+Pj4+Pj4+PiBERUZBVUxUIHRlc3QKPj4+Pj4+
Pj4gTEFCRUwgdGVzdAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0SW1hZ2Uj
Y29uZmlnCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgRkRUIC9maXRJbWFnZSNjb25maWcKPj4+
Pj4+Pj4KPj4+Pj4+Pj4gVGhlIGxhc3QgY29tbWl0IG9mIHRoZSBzZXJpZXMgaXMgb25seSBhIG1p
bm9yIGltcHJvdmVtZW50Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB0ZXN0ZWQgdGhpcyBv
biBteSBQdW1hIFJLMzM5OSBhbmQgaXQgZG9lcyB3b3JrIGFnYWluLCB0aGFua3MuCj4+Pj4+Pj4K
Pj4+Pj4+PiBIb3dldmVyLCBJJ20gbm90IHN1cmUgdGhpcyBpcyB3aGF0IHdlIHNob3VsZCBnbyBm
b3I/Cj4+Pj4+Pj4KPj4+Pj4+PiBNeSB3b3JyeSBpcyB0aGUgZm9sbG93aW5nOgo+Pj4+Pj4+IFdo
YXQgaGFwcGVucyBmb3Igb2xkIHJlbGVhc2VzIChwcmUtdjIwMjIuMDQpIHdoZXJlIEtFUk5FTCB3
b3JrZWQgCj4+Pj4+Pj4ganVzdCBmaW5lIHdpdGhvdXQgdGhlIEZEVCB0byBsb2FkIHRoZSBmZHQg
ZnJvbSB0aGUgZml0aW1hZ2UgY29uZiAKPj4+Pj4+PiBzcGVjaWZpZWQgaW4gS0VSTkVMIGZpZWxk
PyBXb3VsZCB3ZSBub3cgbmVlZCB0byBrZWVwIGFuIAo+Pj4+Pj4+IGV4dGxpbnV4LmNvbmYgZm9y
IHByZS0yMDIyLjA0IHJlbGVhc2VzIHdoZXJlIEZEVCB3b3VsZG4ndCBiZSBzZXQgCj4+Pj4+Pj4g
YW5kIG9uZSBmb3IgMjAyMy4wMSBhbmQgbGF0ZXIgd2hlcmUgRkRUIHdvdWxkIGJlIG1lbnRpb25l
ZD8gVGhhdCAKPj4+Pj4+PiBkb2VzIG5vdCBzZWVtIGxpa2UgYSBnb29kIHRoaW5nIGZvciBkaXN0
cm9zLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB1bmZvcnR1bmF0ZWx5IGNhbm5vdCBhbnN3ZXIgdGhlIHF1
ZXN0aW9uIG15c2VsZiB3aXRob3V0IAo+Pj4+Pj4+IHNwZW5kaW5nIHNpZ25pZmljYW50IGVmZm9y
dCBwYXRjaGluZyB2MjAyMi4wMSB0byBnZXQgaXQgdG8gd29yayAKPj4+Pj4+PiBvbiBvdXIgUHVt
YSBtb2R1bGUuIERvZXMgYW55b25lIGhhdmUgYWNjZXNzIHRvIGEgYm9hcmQgdG8gcXVpY2tseSAK
Pj4+Pj4+PiBjaGVjayBhbiBleHRsaW51eC5jb25mIHdpdGggS0VSTkVMIGFuZCBGRFQgc2V0IHRv
IC9maXRJbWFnZSBvbiBhIAo+Pj4+Pj4+IHYyMDIyLjAxIHJlbGVhc2U/Cj4+Pj4+Pgo+Pj4+Pj4g
SSdtIGJ1aWxkaW5nIGtpcmtzdG9uZSBpbWFnZXMgd2l0aCBtZXRhLW1lc29uIGhhdmluZyB2MjAy
Mi4wMSwgCj4+Pj4+PiBJJ2xsIHRlc3Qgd2l0aCBGRFQgc2V0IHRvIC9maXRJbWFnZSB0byBzZWUg
aWYgaXQgYnJlYWtzLgo+Pj4+Pgo+Pj4+PiBJdCBicmVha3M6Cj4+Pj4+IEZvdW5kIC9leHRsaW51
eC9leHRsaW51eC5jb25mCj4+Pj4+IFJldHJpZXZpbmcgZmlsZTogL2V4dGxpbnV4L2V4dGxpbnV4
LmNvbmYKPj4+Pj4gMTrCoMKgwqAgWW9jdG8KPj4+Pj4gUmV0cmlldmluZyBmaWxlOiAvZml0SW1h
Z2UKPj4+Pj4gYXBwZW5kOiByb290PVBBUlRVVUlEPTNlYmMwMDA1LTAyIHJvb3R3YWl0IGNvbnNv
bGU9dHR5QU1MMCwxMTUyMDAKPj4+Pj4gUmV0cmlldmluZyBmaWxlOiAvZml0SW1hZ2UKPj4+Pj4g
QmFkIExpbnV4IEFSTTY0IEltYWdlIG1hZ2ljIQo+Pj4+PiBTQ1JJUFQgRkFJTEVEOiBjb250aW51
aW5nLi4uCj4+Pj4+Cj4+Pj4KPj4+PiBDYW4geW91IHNoYXJlIHRoZSBleHRsaW51eCBmaWxlIHVz
ZWQgZm9yIHlvdXIgdGVzdCA/ZG8geW91IGhhdmUgbXkgCj4+Pj4gcGF0Y2ggPwo+Pj4KPj4+IEl0
IHdhcyBleHBsaWNpdGx5IHdpdGhvdXQgeW91ciBwYXRjaCBhcyBRdWVudGluIGFza2VkLCBoZSBo
b3BlZCBhZGRpbmdoCj4+PiAiRkRUIC9maXRJbWFnZSIgd291bGQgbm90IGJyZWFrIHUtYm9vdCBw
cmUgZDViYTYxODhkZmJmLCBidXQgbm8uCj4+Pgo+Pgo+PiBZb3VyIGltcGxlbWVudGF0aW9uIHJl
cXVpcmVzIGNoYW5nZXMgaW4gZXh0bGludXguY29uZiAod2hpY2ggY291bGQgYmUgCj4+IGZpbmUs
IEknbSBub3QgYXJndWluZyBhYm91dCB0aGlzIHNwZWNpZmljYWxseSkuIEkgaG93ZXZlciB0aGlu
ayB3ZSAKPj4gbmVlZCB0aG9zZSByZXF1aXJlZCBjaGFuZ2VzIHRvIGJlIGJhY2t3YXJkIGNvbXBh
dGlibGUgd2l0aCBvbGRlciBVLUJvb3QuCj4+Cj4+IFRoaXMgbWVhbnMsIGEgbmV3IGV4dGxpbnV4
LmNvbmYgdGhhdCB3b3JrcyBvbiBuZXdlciBVLUJvb3Qgc2hvdWxkIGFsc28gCj4+IHdvcmsgb24g
b2xkZXIgVS1Cb290IHdpdGhvdXQgeW91ciBwYXRjaC4KPj4KPj4gT3RoZXJ3aXNlLCB3ZSB3b3Vs
ZCBoYXZlIHRoZSBmb2xsb3dpbmc6Cj4+Cj4+IFUtQm9vdCBcIGV4dGxpbnV4LmNvbmYgfHwgb2xk
IHwgbmV3Cj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiBvbGTCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8fCBPS8KgIHwgTk9LCj4+IG5ld8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHx8IE5PSyB8IE9LCj4+Cj4+IFdo
YXQgSSBhbSBob3BpbmcgZm9yIGlzOgo+PiBVLUJvb3QgXCBleHRsaW51eC5jb25mIHx8IG9sZCB8
IG5ldwo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gb2xkwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfHwgT0vCoCB8IE9LCj4+IG5ld8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHx8IE5PSyB8IE9LCj4+Cj4+IG9yIGV2
ZW4gZml4IHRoZSBzdXBwb3J0IGZvciBuZXcgVS1Cb290IHdpdGggb2xkIGV4dGxpbnV4LmNvbmYg
KGJ1dCAKPj4gdGhhdCBzZWVtcyBub3QgcG9zc2libGUgYmVjYXVzZSBob3cgZDViYTYxODhkZmJm
ICgiY21kOiBweGVfdXRpbHM6IAo+PiBDaGVjayBmZHRjb250cm9sYWRkciBpbiBsYWJlbF9ib290
Iikgd29ya3M/KS4KPj4KPiAKPiBZZXMgYnV0IEkgZG9uJ3Qgc2VlIGFueSBwb3NzaWJsZSBzb2x1
dGlvbiB0byBzb2x2ZSBhbGwgdGhlIGNvbWJpbmF0aW9uIAo+IHdpdGggZDViYTYxODhkZmJmIGFu
ZCB3aXRob3V0IG9yIHdpdGhvdXQgRklUOgo+IAo+IHRoZSBvbGQgZXh0bGludXguY29uZiB3aXRo
IEZJVCBhcmUgYWxyZWFkeSBubyBtb3JlIHdvcmtpbmcgYXMgZXhwZWN0ZWQgCj4gd2l0aCBjdXJy
ZW50IFUtQm9vdCAoMSkKPiAKPiB3aGVuIEZEVCBhbmQgRkRURElSIGFyZSBhYnNlbnQKPiAKPiAK
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXh0bGludXguY29uZiB8fCBrZXJuZWwgPSB1SW1hZ2Ug
fCDCoMKgIGtlcm5lbD0gRklUIMKgwqAgfCAKPiBrZXJuZWwgPSBGSVQKPiAKPiAgwqDCoMKgIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfHzCoCBGRFQgYWJzZW50wqDC
oMKgwqAgfCBGRFQgYWJzZW50wqDCoMKgwqDCoMKgwqAgfCBGRFQgPSAKPiBGSVQgKG15IHByb3Bv
c2FsKQo+IAo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gCj4gVS1Cb290
IDw9IHYyMDIyLjAxLXJjMsKgwqAgfHwgS0/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IE9L
IHVzaW5nIERUIGluIEZJVMKgwqAgfCBub3QgCj4gc3VwcG9ydGVkCj4gCj4gVS1Cb290ID49IDIw
MjIuMDEtcmMzwqDCoCB8fCBPSyAoMSkgwqDCoMKgwqDCoMKgwqAgfCBPSygyKXVzaW5nIFUtQm9v
dCBEVCB8IG5vdCAKPiBzdXBwb3J0ZWQKPiAKPiBuZXh0IHdpdGggbXkgcHJvcG9zYWzCoMKgwqAg
fHwgT0sgKDEpwqDCoMKgwqDCoMKgwqDCoMKgIHwgT0soMil1c2luZyBVLUJvb3QgRFQgfCBPSyAK
PiAodXNpbmcgRFQgaW4gRklUKQo+IAo+IAo+ICgxKSB3aXRoIGQ1YmE2MTg4ZGZiZgo+IAo+ICgy
KSBSaXNrIHRvIGhhdmUgdW5hbGlnbmVkIERUIGJldHdlZW4gVS1Cb290IChvbGQpIGFuZCBrZXJu
ZWwgKG5ldykKPiAKPiAgwqDCoMKgID0+IFUtQm9vdCBiZWhhdmlvciBjaGFuZ2Ugd2l0aCAyMDIy
LjAxLXJjMygxKQo+IAo+IAo+PiBUaGlzIHdvdWxkIGdpdmUgYW4gZWFzeSBtaWdyYXRpb24gcGF0
aCB0byBhbnkgY3JlYXRvciBvZiB0aGlzIAo+PiBleHRsaW51eC5jb25mIGZpbGUgYnkganVzdCBt
aWdyYXRpbmcgdG8gdGhlIG5ldyBmb3JtYXQgd2hpbGUgbm90IAo+PiByZXF1aXJpbmcgaXQgdG8g
Y2FyZSBhYm91dCB0aGUgdmVyc2lvbiBvZiBVLUJvb3QgYmVpbmcgdXNlZC4KPiAKPiAKPiBJIGFn
cmVlLCBpdCBpcyBiZXR0ZXIgdG8gYmUgYmFja3dhcmQgY29tcGF0aWJsZS4KPiAKPiBTbyBJIHNl
YXJjaCBhIHNvbHV0aW9uIHRvIGtlZXAgdGhlIG5ldyBmZWF0dXJlIGludHJvZHVjZWQgYnkgCj4g
ZDViYTYxODhkZmJmICgiY21kOiBweGVfdXRpbHM6IENoZWNrIGZkdGNvbnRyb2xhZGRyIGluIGxh
YmVsX2Jvb3QiKSBidXQgCj4gb25seSB3aGVuIEZJVCBpcyBub3QgdXNlZCBhbmQgZmFsbGJhY2sg
dG8gcHJldmlvdXMgYmVoYXZpb3IgZm9yIEZJVC4uLi4KPiAKPiAKPiBidXQgaXQgaXMgdG9vIGNv
bXBsaWNhdGVkOiBweGUgdXRpbHMgbmVlZCB0byBsb2FkIHRoZSAia2VybmVsX2FkZHIiIGFuZCAK
PiB2ZXJpZnkgaWYgaXQgaXMgYSBGSVQgYmVmb3JlIHRvIGNoZWNrIGlmICJmZHRjb250cm9sYWRk
ciIgaXMgcHJvdmlkZWQsIAo+IGJ1dCBJIGNhbiB0ZXN0IGFuIHNvbHV0aW9uIGlmIHlvdSBoYXZl
IGEgcHJvcG9zYWwuCj4gCj4gCj4gTW9yZW92ZXIgSSBhc3N1bWVkIHRoZSBGSVQgZmVhdHVyZSBp
cyBub3QgbGFyZ2VseSB1c2VkIGluIGdlbmVyYXRlZCAKPiBleHRsaW51eC5jb25mIGZpbGUgYXMg
dGhlIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBieSAyMDIyLjAxLXJjMndhc24ndCAKPiBkZXRlY3Rl
ZCB1bnRpbCBub3cuCj4gCgpJdCdzIHRoZSBkZWZhdWx0IGluIFlvY3RvIHdoZW4geW91J3JlIGJ1
aWxkaW5nIGZpdCBpbWFnZXMgOikgVS1Cb290IAoyMDIyLjAxIGlzIG9ubHkgaW4gWW9jdG8gc2lu
Y2UgS2lya3N0b25lIGFuZCBpdCdzIG9ubHkgdGhlIGRlZmF1bHQgCnZlcnNpb24sIHdoaWNoIGlz
IHJhcmVseSB1c2VkLiBWZW5kb3JzIGFsc28gaGF2ZSBhIHRlbmRlbmN5IHRvIHN0YXkgd2F5IApi
ZWhpbmQgYW5kIG5vdCB1cGdyYWRlIFUtQm9vdCAod2UndmUgZG9uZSB0aGlzLCB0cnlpbmcgdG8g
Zml4IGl0IHJpZ2h0IApub3csIHlvdSBwcm9iYWJseSBzYXcgdGhlIG51bWJlciBvZiBwYXRjaGVz
IEkgc2VudCB0byBmaXggb3VyIHBvb3IgUHVtYSAKbW9kdWxlIGluIHRoZSBsYXN0IHllYXIgOikg
KS4KCkFueXdheXMsIEkgdGhpbmsgd2UndmUgc29tZXRoaW5nIHdlIGNhbiB3b3JrIHdpdGggbm93
OiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIwMjIxMjE0MDY0NTE4Ljc1MzQzMi0x
LW1hcmV4QGRlbnguZGUvCgpXZSBuZWVkIHRvIHRha2UgdGhpcyBvbmUgYW5kIHRoZW4gYXBwbHkg
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3UtYm9vdC8yMDIyMTIxNzE3NDExMy43NDU5LTEtbWFy
ZXhAZGVueC5kZS8gYWdhaW4uCgpJJ2xsIGFzayBNYXJlayB0byBtYWtlIHRoaXMgYSB2MyBhbGwg
dG9nZXRoZXIgYW5kIG1hcmsgaXQgdXJnZW50IGZvciAKbmV4dCByZWxlYXNlIHNvIFRvbSBrbm93
cyBoZSBzaG91bGQgbWVyZ2UgaXQgQVNBUC4gRG9uJ3QgaGVzaXRhdGUgdG8gCnByb3ZpZGUgZmVl
ZGJhY2sgb24gdGhvc2UgcGF0Y2hlcyBiZWNhdXNlIEkgZXhwZWN0IHRob3NlIHRvIGJlIG1lcmdl
ZCAKcXVpdGUgZmFzdC4KCkNoZWVycywKUXVlbnRpbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
