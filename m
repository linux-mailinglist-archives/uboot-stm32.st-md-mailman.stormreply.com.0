Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4B2C40A3
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 13:55:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1593C424AF;
	Wed, 25 Nov 2020 12:55:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80110.outbound.protection.outlook.com [40.107.8.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81CDAC32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 12:07:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDgi8ZHAZ4knBwMtsHLFLaOvCGwE2DGZaYa/yei1Hl0x7vA7EOxhMouJk33ViMtPdjKWPgZg3t8oQ3LY1kGuwHSdUx6uQjX8zk1yo9CkJVDrzhiVz8G3mc6J4y8F1EKyNet7ywq+wTDpPfBPhemOkyfP0s+AFpPsyobeTqwLaFPBE9GICZ9792XvjckCK+ctMsE6tGtWAoOWXC16tVNp3W310xR6W3zBpPUTguYuDZ7obm0qyN/zX9QV5cEXAijgv+xozF+bn2JEOpFf8aiVfoZ/TJ3sebY168JT7tkCaXtq0QPKs6mP6ReiFRBQtFlWYWvAoCff36enh/g9uyCl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB9qAbMcgMuoDgg5L03wEGRX/o3vyZbfkk9J728ZxeI=;
 b=T04dZHnPGMudeaD1FmwvIJzUGL14HW/uZDuLOmWuimAcWKWYT8qyrUZYPiuhrp6M2dDzOHtP83C+Hm2V6xyt6RavbCExwLNib5UPakyHBpZy+BNQkHxgp4h/nITWFfHYfGwUdLkd9sCGitAWDg8xa+uLONSKp8hQs2LZQrlrlSUsdLryS/TwVdNgil4dzXYuZa25FZG+OVyUZrv7CKfV7xDExOJC7rZ+bg86B5b3tS9CSswaQkV+HXBVpMg3Srf7gcgsMKLR6AF9Y1F3dCTFtmUXmRk5reozd/8WK/0kxSaWg8gcidPonmreeVIzVByjHR6X+SAWp7BjbrMqukgAGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB9qAbMcgMuoDgg5L03wEGRX/o3vyZbfkk9J728ZxeI=;
 b=Lqaz0HLnh20LZ98PZkZmvDPdiSycsenwf1QPBBS/LkhxCm+8NmTzMrAmAd1xYxJV/oRSxMiWZMcaEnHtgeiv8FWcqP433nzpMPecL02E7F8hay53oESBHjLT2lQ2t3MlbPgYGJ5Gh9NndI0bwpveN3XMh+JUzY7QDu1YEYCLIDE=
Authentication-Results: st-md-mailman.stormreply.com; dkim=none (message not
 signed) header.d=none;st-md-mailman.stormreply.com; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2916.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:165::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 12:07:45 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 12:07:45 +0000
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20201125122610.1.I56a5b1310adc1bce11401f8f2e1577be96dee65a@changeid>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <e2ef8d3d-8725-0737-437d-ba3e2642cf7f@prevas.dk>
Date: Wed, 25 Nov 2020 13:07:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201125122610.1.I56a5b1310adc1bce11401f8f2e1577be96dee65a@changeid>
Content-Language: en-US
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6PR02CA0018.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::31) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by
 AM6PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:20b:6e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 12:07:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36cd0e1-2f14-486a-dbfa-08d8913ab799
X-MS-TrafficTypeDiagnostic: AM0PR10MB2916:
X-Microsoft-Antispam-PRVS: <AM0PR10MB29167C33AB829787B7D6E3AF93FA0@AM0PR10MB2916.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvnC5VBjWWjilaDrXvn9FVuLfplE+ZAl3JYCcAojR9f8z3gT2WSkJ73PjBhR6uHlonCT+cmbHt2oT4DFV81IF0CH++YfTthFQInCE9K5oDbsss3xTdfUThfSc6g0hkiWG2pbsXH5lmwZfqREIqp9hSphX9I+lI6jSibUyyYzrnhMa4D6jem8Smit7s/XavDDKS/e9ohlw3gFnJRWdNZTofaMMkCZ8Ta24M2UilrThnmmVdv8FxBvRYaaTRvpAspK0irgxm4g1wzlm/EL7GDnlLS0DwMbH70YO73xYEWgFtIjlhbI3zy4xIcoH2LqsX2SICCvolAcNK2B3DmHeA7aw0XRHubY4mU0HFbZ94/H9l7Hh7JUg4qPUqymJ4HCGsdN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39850400004)(376002)(136003)(366004)(8936002)(8976002)(6486002)(31686004)(36756003)(8676002)(16576012)(316002)(31696002)(66556008)(66476007)(2906002)(5660300002)(66946007)(83380400001)(52116002)(186003)(16526019)(956004)(2616005)(4326008)(26005)(86362001)(54906003)(478600001)(44832011)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: fp7wCPQ4Fot4Txr4kzU9w0hCFRlcb/406KnaXCjpLukmkZi7ryUhqcHceGLplOxcTnolWHgSfQ8Uu0QyMTVhZohVOKeSD4Swh8fbteMd7Ui7QgxbgGa4k+3qfhvR1V4h8E+ntimNHhmUVazsKECQEZkZNEl4f6LOsJOXlq8ZAuDbNGrtqlfX9TeBa/+nUrkfcYKmj3TJb++joR2Dx7OeS8ZlHTLn77YNU4fdMxKvyhFuydTwyUHA9lVawUbU5JPcIbfkiUny0KeA0EnipEJ0+PfQhDP+cS0gt8mD/NEYwocB4td4NqW5fYkh8xJCRUi87seZVEvMPj+9wDF5dWUUfpsuRmvTgw+AeTxlkauJX3doo2sjQRUDleLF/LTF0g7U0WDGzHxar+Oy9YaRWGrJKFePWKZlWzhy+++eeOe8wOE0ncY1lAKyXxLyczmhdc6Wg1OQOiYD50FZhami5dNEeQYFqc+lSBfTy5uCXYFAciTzADlapoAmcYJH0IFEaXarpfXZrOEqdQp4+gzfujoSaxU8kRIZVATqz/qIuywsrWzuXjLxmjHmgteh80Y8F1SXqJE2sRiqvX9XRzchZ0jrOdZwdXjpWk347z37KEZkybb/7mHWfgI42cYsSWHUjgZtpN2G9amJ6cIxS8Q7OY0wm6pbIjwRvz7slBdbvfzfjaWlD1gtglFj9AAKp7M6hmoQh5mzcB60+qI9N0JcP5tT3+LD4Mc9nudIiUfkqtLTMkv6j4Ej+bk+RhhScZ8zyqZ4hXnedzLXBZj+kN0EM2edVE8sLKziHNRMTQQNqNcBO3lPmqeVlSEozmyf0shHfgmSJkD/n3fCDtYh4FxKlWJDYH7Lk3IFxcZEtZg4+xRZM4GBBZSeY2JIKgJBGQHxFnIbJM5skPdoHZS2wP2nSb0m0Q==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: a36cd0e1-2f14-486a-dbfa-08d8913ab799
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 12:07:44.9478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pttRoHCFWYrxjvf9LPU6CrdOYUE+3EatxZT+70M+8nC4NAxJA9za2AzdD55EscHEx6ArhL6YdvIVcc+4nIRsb5LI4bg6zZG7axpWVGkimro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2916
X-Mailman-Approved-At: Wed, 25 Nov 2020 12:55:46 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] string: Use memcpy() within memmove()
	when we can
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

On 25/11/2020 12.26, Patrick Delaunay wrote:
> A common use of memmove() can be handled by memcpy(). Also memcpy()
> includes an optimization for large sizes: it copies a word at a time. So
> we can get a speed-up by calling memcpy() to handle our move in this case.
> 
> Update memmove() to call also memcpy() if the source don't overlap
> the destination (src + count <= dest).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> This patch allows to save 38ms for Kernel Image extraction (7327624 Bytes)
> from FIT loaded at 0xC2000000 for ARMV7 board STM32MP157C-EV1,
> and with kernel destination = Load Address: 0xc4000000,
> located after the FIT without overlap, compared with
> destination = Load Address: 0xc0008000.
> 
> -> 14,332 us vs 52,239 in bootstage report
> 
> In this case the memmove funtion is called in common/image.c::memmove_wd()
> to handle overlap.
> 
> 
>  lib/string.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/string.c b/lib/string.c
> index ae7835f600..ef8ead976c 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -567,7 +567,7 @@ void * memmove(void * dest,const void *src,size_t count)
>  {
>  	char *tmp, *s;
>  
> -	if (dest <= src) {
> +	if (dest <= src || (src + count) <= dest) {
>  		memcpy(dest, src, count);

Hm. So the condition you add (src + count <= dest) implies no overlap at
all, so that's ok. So this doesn't really have anything to do with your
patch per se.

The existing condition relies on memcpy doing forward-copying. That's
the case if the implementation from lib/string.c is in use, i.e. if
__HAVE_ARCH_MEMCPY is not defined. And if an arch defines
__HAVE_ARCH_MEMMOVE, this memmove() is not used.

But AFAICT, there's a potential problem for the case where
__HAVE_ARCH_MEMCPY is defined but __HAVE_ARCH_MEMMOVE is not, and e.g.
arch/arm/include/asm/string.h does

#if CONFIG_IS_ENABLED(USE_ARCH_MEMCPY)
#define __HAVE_ARCH_MEMCPY
#endif
#undef __HAVE_ARCH_MEMMOVE

Of course, the arch-specific implementation _may_ also do
forward-copying (I haven't tried to decipher it), but that seems to be a
rather fragile assumption. At the very least, some comments would be in
order.

Rasmus
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
