Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKBwLq3t22mLIwkAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Apr 2026 21:08:29 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCCA3E5A7A
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Apr 2026 21:08:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA7EBC87ED1;
	Sun, 12 Apr 2026 19:08:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27BE9C87EC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2026 19:08:28 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43cf8d550bdso3659387f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Apr 2026 12:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776020907; x=1776625707;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=glS/nvvZhUb41hVZDQcgKJHELerAAQ/NlE60k41Bzdw=;
 b=pE6nNrFpP9JsMEP1perfPB2oXbL/XuceWKbJjfPQeDj4Fh8X1RYFmLOUqu3AmrrkUe
 WVBEl07Z+qYA96t9UeXt3nDU1bsdwddOVZD8XrQRvqsjdlwKQ99GpcbSrR9rr2Lh/0y0
 qyb/eg624r0yD2MZ6Yh83ycWiePjWrV/o0WOmEwxn63IGsZeupWjVGvCXcVyscYuc8Ye
 SXW/8EQc0oSoRy2D8jEfgYaRb9zlb/ZZT9jF8roSVFF5M4OsxK5E3+kHm2umuesJTvIb
 DNjYVXeB8jhGmWNjVHwrTSYVrwbe2B/M6kbEZ1KNVPdHsBTAO7z14n1qQguuZ6nuDwUE
 /GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776020907; x=1776625707;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glS/nvvZhUb41hVZDQcgKJHELerAAQ/NlE60k41Bzdw=;
 b=UkIGljWeR0BAujJn6hyDkf91kiMpTunjuCxPUAoTzSAMYrsBSevkMYLXH3lx6FOaR2
 HvmxI/bnpavhnrp2NKbUP5wIO8xLXdLPblcyzViv4SkaR8LZhQNkQxID66xaJgx+hzwR
 nSnMkG51QmkqKhY6fwRNmSN0kbheKEfKGseTI42TqJf1/8LEmC/dqcOM/ANhHWZAHpap
 Vsu8jvtEDH0T5gtXJGPTDbNo0gvaL/cQlX37mr8gHQrOjozXyr1iX5//a9J8eu5sRUs1
 3bdXcfpV6POL23ct77ekf3WnvvMmKQx0DDoZphVWMQ+2YoAl98n6t0oPG9lmsRiC/hQ+
 JRxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/4gjjeN+MNyrBcY41/AK/5THxxejD3jp5NyirzcBsxf+Wu4WNYWUXq4NlMPw5K6xaXCj3HW7zMBxAGTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0Fk64eK5D7tuBMNZ3K3b+7YHi9lRyyNQcNfQFEO7A7Cv3AcTI
 v/oqByLO3bqtDhjehXh6GCGT54HRrIfSgRxN0UMSSCn0ataNWzM/Vgec
X-Gm-Gg: AeBDieut9aPjQAzxegnfp8KVcryTJzWyjTjJ8bI0s5h9qqlpqTjkwvLeyB2ssvPk/me
 OUBT1/rxphez9M3xuClMwwhAfwg5yVTMLwHh2VAoQJlc7sIFyuNsFyjVEfnVkKwOMeNe6xvGHYd
 qYMLvSlMVySPjjjD/cm7GoLDWsJRrIuGotH8LnZ7Cp3PN2L7w0tToJ/GpcgWjA5phOUHynSPXQx
 4hnhbXwXeILXJEA4LH09yr9f8Yrz72cjUjW9wA0P7Yie2x60GDWzMbzUeBEO/6ol/UmKRztluP6
 1LnuVDiIrdVIhxVY6BM4/1yv2NK32Kgzf+WAKrN+kdZl/5+nXMayXbR9NdHdbQcn7kfFPAGHR+d
 jLfHcxmskY63ZhFBEOdb63f2qCjDEHBrAwbUZC6A8JCKvQTkn0IaIIuhXesQC//a8B4KH38PXF3
 x71EiwAB+mWAV22X/1W+wqfGdz
X-Received: by 2002:a5d:5d12:0:b0:43d:613:33de with SMTP id
 ffacd0b85a97d-43d642a63d1mr15188854f8f.20.1776020907254; 
 Sun, 12 Apr 2026 12:08:27 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d73b44b3esm8487333f8f.13.2026.04.12.12.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2026 12:08:26 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sun, 12 Apr 2026 21:07:58 +0200
MIME-Version: 1.0
Message-Id: <20260412-master-v1-1-d7a8e742233c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mj3dzE4pLUIl2LpFQzcwszs1QDSzMloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AxtE3bmoAAAA=
X-Change-ID: 20260412-master-8be67866e096
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=ZF5uHX2CbcTIGuyN0meT8DGgNQWE0Wup3xaGR3i4Afo=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBp2+2QjxH0I/73m2jMc0v/H7HU7GhMUPq4ZNSvn
 DnhIxOuSHKJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCadvtkAAKCRDnIYpo1BLC
 tdS8D/9RXbtiX7P1DpeUdA6rn2tUQ1y0k3vAnKB81jFp+qR9j+XeEEzbwNGm25+ptfrYC0GqqoZ
 Mw5kfasxUkSNAuxG/vbxPJruTygg4AhFh5cCAYGmN7RY7bhyJpa3BTihHS+2Z7ChadjrfAxNwe6
 GVU+jsCnxIGoZuxZIzQCx4/hUMPbHO0YCrQFEkOUL/IFVr6dAzzYN9KCbptYp6tpmRRK9xmE9Lm
 +VIZ9F+SxC2xsyMmfRKLbLUB9MtlPBfcJm6H4GRF/ojVfO+X2ePHWqTaUBLM8C8tA9cfg0pE8Xk
 ZtbxKPqmhvRUQBS0xL27xs9B5pOuBgDxH10mlTNgS9/DnqJ8py3g+dJspZ/U2sYz578R7cO/2EE
 gCIYUtUTYMgq5nDutZtt2Sqssl+CWdPjAq9yI4WHlPqo2lp1YPhCsrfNx6UpDVpGcHXdymgIIg0
 9PJrXTZOz11JJuSc0OlBoPWajSNJbqICAzTklqKSkWpjpFJzeocscp/9DFKLvXV+wnJ3lc74EZq
 8Reax+PVY21J1fdkZhYBhFuAI7cHezHWZzSllxlu5NwFi8yGzJ717Z8+vxuw8q86w24+9YE8Cbq
 f35onhMLmWtaScen9eKLc0CcTVusV5aswy3p9R3gfWvIRGbr8bIkka5NL7h2vObU76FJuLBkguH
 l98Xhepi5moNF+w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: [Uboot-stm32] [PATCH] video: stm32: dsi: fix unchecked return values
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:ag.dev.uboot@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.962];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rgallaispou@gmail.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 4BCCA3E5A7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the following errors yielded by Coverity Scan:

CID 644836:         Error handling issues  (CHECKED_RETURN)
Calling device_chld_unbind without checking return value (as is done elsewhere 6 out of 7 times)
CID 644834:         Error handling issues  (CHECKED_RETURN)
Calling device_chld_remove without checking return value (as is done elsewhere 4 out of 5 times).

Link: https://lore.kernel.org/r/20260309212331.GF1388590@bill-the-cat/
Fixes: a6d047c0a86b ("video: stm32: remove all child of DSI bridge when its probe failed")

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/video/stm32/stm32_dsi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index 65a91f5cff7a..5c4d8d2aab51 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -493,8 +493,11 @@ static int stm32_dsi_probe(struct udevice *dev)
 	    priv->hw_version != HWVER_131) {
 		dev_err(dev, "DSI version 0x%x not supported\n", priv->hw_version);
 		dev_dbg(dev, "remove and unbind all DSI child\n");
-		device_chld_remove(dev, NULL, DM_REMOVE_NORMAL);
-		device_chld_unbind(dev, NULL);
+		ret = device_chld_remove(dev, NULL, DM_REMOVE_NORMAL);
+		if (!ret)
+			ret = device_chld_unbind(dev, NULL);
+		if (ret)
+			dev_err(dev, "Unbinding from %s failed %d\n", dev->name, ret);
 		ret = -ENODEV;
 		goto err_clk;
 	}

---
base-commit: e2fa3e570f83ab0f9ce667ddaec9dc738bcf05b9
change-id: 20260412-master-8be67866e096

Best regards,
--  
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
