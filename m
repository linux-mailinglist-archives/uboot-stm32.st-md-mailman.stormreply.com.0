Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKv1JInVAWryjwEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2026 15:11:37 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E55350EA0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2026 15:11:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC3DBC8F274;
	Mon, 11 May 2026 13:11:36 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CCDCC87EC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 13:11:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-bd1caeba6beso59499166b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 06:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778505094; cv=none;
 d=google.com; s=arc-20240605;
 b=IR8Jq0aKRnMUQ5ZsTBWh40UPVhGxH6MwI6zEYD6YFM+GkrXIPV6/rzWp8gDKGh6tNX
 WUW5X+B79/v3DZn8KnVEUU7gLGkU7LeM7IZyYzA5hJ7oMJmIPWjQsVI93PqU5q3VzOZB
 7IpQka4vGW/8N3OwQ+H/B050J+Iv8lLy7idkTlItF8qCXsQNITV7hKo+oK5XcMgoxwNN
 QvMA8LHbyCB3yWCXsjkQfVndu0MMmoUY9Kpsyu0YA/oap1AP57mfzrOuy20x57FV48W/
 W1pMVlRtQZ1p4NDcfeqrmY0pifmO4FmAgAiNSSleqCS3eMUH5eMhw8dnBmrbsb2vJ/8b
 Ldtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pmgiTsXZIdpnkqsD5y4GPgBzCB0XSOR8tDx8PzFLdtc=;
 fh=Vr9Yl3uH5Wtzufcq9Sr/f6z/QVMNpC219MF15/enybM=;
 b=aHe0BXY3N2UTrgXnhHZ7nYM+brqWVFWwHictEBJYrPPyO7FYOY6GxLAdwkbr4eIcYb
 mvPlHqo/wCbkMs4SeOQ0Nr28RaSPTKg5JW5EV+dSJTqhH5V2G6Hr22WGXhRMkGVknnUJ
 197+loTj6yoBr5T4IPNIwExC4zdRTXZV4vlozRfusQXMKU8/f0E4Y27ddi79XmSd5bwF
 3WLWIeq8j3Jc1X3m756YLLheAk062FNIBF5xaahtNsmUT33LYOmuvzkJOrtFLFSlbMSf
 ycd8PD7A2HVnzMVAUXudq9pH0fsx0tvezTgLhr4EtVxGjJfEJDbNMiFguo6Rog9h72yX
 byBg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1778505094; x=1779109894;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pmgiTsXZIdpnkqsD5y4GPgBzCB0XSOR8tDx8PzFLdtc=;
 b=Add7lthw3c00bMPXR9WnhhiX6xng+6d6s2R6cFNXpxDNErh7CPGPTT1SxWCzXQCJnn
 Gj3pNWa6zn887GjgM7qiiAK6Y0YbVEW79SkjRbfsStsNHYVUakW4pT1JyVt/yW5hMQeG
 qsLnwwAG583fKhIDQo/hisHYE+ojRzNOLm9Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778505094; x=1779109894;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pmgiTsXZIdpnkqsD5y4GPgBzCB0XSOR8tDx8PzFLdtc=;
 b=EN80UJXR6qEaqTWXvw9TdDtlE0k+jsXddGG/+HrCt8JKBWCArWsZL/BR1K2RfwtRBV
 vigAXH/22/Yh4fJ3gmw1ngFrtqDVHNjtraNlPCg2FGACDr/fRQNXad9UmQTGa+rvQSyd
 sPgWmd22WxeEHzESwqDwapBHXnNz2kfecYJWDsk35T8ZxI/Hu326c/GTMkO5OAqm+kQZ
 mZRPmZ8MrGBke7Fasd9aKwuQz6CPEGLra4zX0tGgZz0CeV9DIA22pxk41QZsQiyBJaT8
 57XOm85v6e84y78DBKf5og+Uo2r6a9Yeh8AHYdg1NwluvtHn8ku5/nv3GWoprfDRWhqw
 99FQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ82Ev+xLxgwS60aDE6LLTRH9piB+Hl5cGtLnFkVuCs1qZe1h86pafhvP0OnVxiFrZ8iO1qJ+RS9E+OTVQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCrmpNoPmjbXJd3h6ZwI+X6fq0auwG1fcL8GUm481L6mvyYAT7
 olLxwzTW5tixG4agNaNKsaQnmKEVNVu+HNhZxjqBOylXZxyFHuQOQhFS43UgEAyPwxdtTRU0d1w
 60/m2a5C4NbRqBxvYmY2dw0QCbaXwOc2lz1P0VbI/
X-Gm-Gg: Acq92OGwOvX97Jfh2QGnygT6G6rGuIurIYHKYdNuYNWL3LU2amNNMybw1If45TUAmCZ
 aVTbvmxWb2OxmYmMHStKvxncxYYLI3zfCwjDHAiSeEyRNjOGNBagHYeiYfmAxXIGPJSXDcHaIyN
 ffgP3gjOHtmJAPH2FHIhXPJ3gwjIRY+E9rxL9Zz5j2RSOZivaCO99B67lDzQqW9CrebV0w4x1W4
 B7OJtyJh/z7ia+DarNjLjcDccjeOH3+kzauW3Rkmu5aSRxEml289s2gjJmlZ09fkP2OmryXZXtI
 AB2fjA==
X-Received: by 2002:a17:907:60d3:b0:bad:f032:fc78 with SMTP id
 a640c23a62f3a-bcaa9f60fbbmr727202566b.1.1778505094258; Mon, 11 May 2026
 06:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260510171723.56866-1-marek.vasut+renesas@mailbox.org>
 <20260510171723.56866-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260510171723.56866-9-marek.vasut+renesas@mailbox.org>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 11 May 2026 07:11:03 -0600
X-Gm-Features: AVHnY4JgQy_iofIvGdS81MhcwCrpyudV3szEv1Jhd-vUR9IYsFoHr444HoGfr_A
Message-ID: <CAFLszTiQMA-1e4Tcvxrpxr6=sV5ig5M5TOfrzL-NWEh-A0w00g@mail.gmail.com>
To: marek.vasut+renesas@mailbox.org
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 09/11] video: stm32: Staticize and
	constify driver ops
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
X-Rspamd-Queue-Id: 2E55350EA0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:trini@konsulko.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:ag.dev.uboot@gmail.com,m:marek.vasut@mailbox.org,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[konsulko.com,lists.denx.de,st-md-mailman.stormreply.com,foss.st.com,gmail.com];
	DKIM_TRACE(0.00)[chromium.org:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.426];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,mailbox.org:email,mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On 2026-05-10T17:16:56, Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> video: stm32: Staticize and constify driver ops
>
> Set the ops structure as static const. The structure is not accessible
> from outside of this driver and is not going to be modified at runtime.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> drivers/video/stm32/stm32_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
