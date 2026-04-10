Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDNzAcWD2WmvqQgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 11 Apr 2026 01:12:05 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2623DD68A
	for <lists+uboot-stm32@lfdr.de>; Sat, 11 Apr 2026 01:12:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A1B7C8F26F;
	Fri, 10 Apr 2026 23:05:11 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE699C87EC2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 23:05:09 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6701c19e7b3so4338629a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 16:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775862309; cv=none;
 d=google.com; s=arc-20240605;
 b=XPKHOHn7SeJ2NC99FwN0uL3G2K09IL44WoZXzR0PrEibGkL5avRZnTYTMfcj7phw3l
 zXbf+3yStTkJ9u21aGGyj55O7GJ/ADDzdLBkP4Jzy+slZjnPwysaPCy7vYZjsMq3BTXt
 xOdNQiBDZZ9jMeXzDv1Lk+dijaHoL+wSth1soAQCka07nVgGC0AEL+MOOj3DVCHNZbMQ
 xM0PC+lcPD49iuvCDYzD6zRZqSH/AfWGQ5eXeMw8iC28FJL9NENe6hx259ikSUQu1oIK
 YI83ka/XFM6XY7xLl36nz1IyeTYScpRIbw/8uAyIazHL7C5093aQJzyjXuCPJkHqquX2
 UZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YHWRrZYu1zI4NCLOelP8cJKWsH2qei3q/OjT57VTYcU=;
 fh=wCNmMJ3cEapUXCnP29DbV6g553WFi+0JU/m7zGMviHQ=;
 b=VSDM5W2t7n9xA/fLeeHzZsU1HxSyI6kcF+gSmkuWLH8X4pR23kfDzjwwCUurgyw3In
 lYPk7wVY9iP750t6AQYJjSIh5dCixDGdoljYhekdYblMf6I9yfx9lBXEymmXxxkh1MNj
 Vy9aqtQy8qc6f4WeJLzMVSfRQtj/LZZOVNfQSZYf3DM5NwveGGdjwvTCxpk7GXYaYhL/
 PZ3BmRkaIZWPWKyphjFlysmsNfnNFxJJcwnKSq00V4UdRMUGRiRvJNHQ7xdcOzftXRVV
 hylPn9Fs7WKGWh2jS02mBVINDMDgYMzaMovEFa1DsnX/aumfwLXOwnY5Hm0gK9t9H4Ij
 4gjg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1775862309; x=1776467109;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YHWRrZYu1zI4NCLOelP8cJKWsH2qei3q/OjT57VTYcU=;
 b=JWGNBtwZpmlk/Ox9NTs2JtYFnYc+jsMXKDq16D37ln23lGf954v3399aRGnKwSyk1c
 GbgepzN5bI/dwMocy7I1sjNIi2pMEOk54k+YDwiUZmqe9d5hBdK5LwSAvuIiyQsCgPGP
 oswBbwaVoskaNteRvPYFocwhAOpwD0flzxtoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775862309; x=1776467109;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHWRrZYu1zI4NCLOelP8cJKWsH2qei3q/OjT57VTYcU=;
 b=jJ24Z0PKSRpcvWq9vsKqwo5z5wqMJt6YpW/jlDB4fKEa5jqZSd+P2gibj6h5lGdmOJ
 HNJK5WTD5muzR0ceLoBgoRP6A07VsBtV4/JHQ144nIGSOTbHQGiPmXiLVFpNlsy6vEr2
 IJ+rqQUWIP6rKQRfQqEXiuCehbO6wqe16wtiKRTO76Lc3cvX6SsIa8SBAtX8uNhKRMOs
 l/y0EbJMVG89Rj+w5el0UBaYP7UnpFmyrHj0E5HipwPG0f9WVbA1Iu/06zQN4hCyj/bq
 nEZE3ZwnUwE53Enu553KmxVjs00dd/h+Qz44q3NLdTalKrpvxXQT9VkqBG/PpDGRX9Ln
 dW+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpEORR5hg1hE3h7rFYoa/AfQiL/eAtjo8EU9BncL0Y3aUPsO5xqeigZhYPserFoQiwLaZ680nM7FTgIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwqfH6ipC7SLbYL/CQqoxR3erzNaVCobdye3+HWHuchM+Qk31ZA
 wLYwZuU2u/1tMSYsUkJs2RRP1p8VAbi++623eV4HWhZA92/uISHNsvt1dmiE9xQ+rBu5M3iaxa3
 lGzF1MDRXaFkXR8tKo56PTy7BHM6aMWhMSBE/80vY
X-Gm-Gg: AeBDievjVdYzeldQVUzM+TBGCl6KE0kZ9LpNKi2pjAoSOmij+SDQnAx+H7pIPs9n8l2
 dtOFrPIHfzEaSgLpducf+LPho37wnkcTv77nD24RAQgKyA/KisRgh0b43i7bLKZzbLBPEjsZbnZ
 M5z2Y3zp9nlKQ7hSemFlMw8EbC9oWLF5aoj2+bOPRV5nMidIfQ6xMfZ+c7CHO6PTVR55pQQcao3
 6fRD/kasK+Uvs5aT5HenFoyFpJOVLYR3J00eHumq9KtvVZcXwzAIG4LcbMuIFgANiC6ui0+NuPC
 vjjkDw==
X-Received: by 2002:a17:907:25cb:b0:b98:695:ec53 with SMTP id
 a640c23a62f3a-b9d7248ab3bmr284883166b.18.1775862308877; Fri, 10 Apr 2026
 16:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260404152640.3297713-1-dario.binacchi@amarulasolutions.com>
 <20260404152640.3297713-8-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20260404152640.3297713-8-dario.binacchi@amarulasolutions.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 10 Apr 2026 17:04:56 -0600
X-Gm-Features: AQROBzA9zZktph614RgZ4_5ahrCioK5KwO69O-4fAtEnRZv0EzOL68RoHA6Eks0
Message-ID: <CAFLszTj3SL0qiXsqa31UhAyf+XZEdV_0QBf6Ly0QVhMjNMD5=Q@mail.gmail.com>
To: dario.binacchi@amarulasolutions.com
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2 7/7] board: st: stm32mp25: support
	dynamic A/B bank bootup
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:linux-amarula@amarulasolutions.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.961];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[chromium.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,chromium.org:email,amarulasolutions.com:email]
X-Rspamd-Queue-Id: 9C2623DD68A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dario,

On 2026-04-04T15:23:27, Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
> board: st: stm32mp25: support dynamic A/B bank bootup
>
> Enable automatic detection of the active A/B bank by retrieving
> partition GUIDs from FWU metadata.
>
> This ensures the system correctly identifies the bootable partitions
> even in multi-bank scenarios, falling back to a standard bootable flag
> scan if the UUIDs are missing.
>
> To enable A/B bank bootup on stm32mp25 boards, add the following Kconfig
> options to the stm32mp25_defconfig:
>
>  CONFIG_FWU_MULTI_BANK_UPDATE=y
>  CONFIG_FWU_MDATA=y
>  CONFIG_FWU_NUM_BANKS=2
>  CONFIG_FWU_NUM_IMAGES_PER_BANK=3
>  CONFIG_CMD_FWU_METADATA=y
>  CONFIG_FWU_MDATA_V2=y
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> board/st/stm32mp2/stm32mp2.c          | 25 +++++++++++++++++++++++++
>  include/configs/stm32mp25_st_common.h | 15 +++++++++++++++
>  2 files changed, 40 insertions(+)

> diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
> @@ -208,4 +208,29 @@ void fwu_plat_get_bootidx(uint *boot_idx)
> +     if (!fwu_mdata_get_image_guid(&boot_uuid, &boot_type_guid,
> +                                   boot_idx) &&
> +         !fwu_mdata_get_image_guid(&root_uuid, &root_type_guid,
> +                                   boot_idx)) {

Just to check - if fwu_mdata_get_image_guid() fails for boot_type_guid
but would have succeeded for root_type_guid, there is no log message
and the function silently succeeds with no environment variables set.
Is this the intended fallback behaviour? A log_debug() might help when
debugging boot issues.

Reviewed-by: Simon Glass <sjg@chromium.org>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
