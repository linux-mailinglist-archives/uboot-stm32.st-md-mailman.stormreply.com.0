Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F4529B2F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 May 2022 09:42:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A24A8C03FC9;
	Tue, 17 May 2022 07:42:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7222AC03FC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 May 2022 07:42:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24H6ut1F022160;
 Tue, 17 May 2022 09:42:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4BuLa1xsnQw1yRiNAu9X1hoRa280mr1tI6jycjZVsAI=;
 b=lElZVM7vycH6/DUe0zWEGZWbg2LdCByejEpfoR0mSJQP8UsmAM3Om6oK30vJ3kHIY2HG
 nPeTsGvDyAWJxURua+PfUg0N168hKVWqL+fYCs5cSIyZlXBnRYTo7QC+PXGoy94PiWu+
 28Ox1kZROcF8Tgk4Q7idZh0p6mTdPSv8qb+VRhs6qLNof3OQuRjHJhbaVGRZRm1K6MIl
 4k/MmNcStAzHWIEzcu9TwY20DSaihdqp7hM1ZmChBfB2jXF1JWuwGcrHiyn8E5yqoWVz
 vdXmbEuZIx7IdFa4pGrPWR5q4LQUC0u6zOOIfs9jn1NN7lt5vJtFmZokvWz9aCNVhaRf AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23ahg48h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 09:42:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9287F10002A;
 Tue, 17 May 2022 09:42:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89AA92132C2;
 Tue, 17 May 2022 09:42:13 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 17 May
 2022 09:42:12 +0200
Message-ID: <4a7519b0-9bb7-f92e-3e73-7be0ba9959d7@foss.st.com>
Date: Tue, 17 May 2022 09:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Sean Anderson <seanga2@gmail.com>, Amelie Delaunay
 <amelie.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
 <20220426143736.1.I15bd7c3c8c983d6a6cec3d2ee371d75fe72fcd41@changeid>
 <27373592-d6c9-ff00-799b-a2f04f4500b1@gmail.com>
 <0aeffe8a-b73a-5e3d-de89-9938d8d53150@foss.st.com>
 <8776d357-028b-0d21-cb90-4cbdd73f4ffb@foss.st.com>
 <78061a89-ab5e-af21-d02a-9deeece3e454@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <78061a89-ab5e-af21-d02a-9deeece3e454@gmail.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] phy: stm32-usbphyc: add counter of
	PLL consumer
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

SGkgU2VhbiwKCk9uIDUvMTEvMjIgMTg6NDgsIFNlYW4gQW5kZXJzb24gd3JvdGU6Cj4gT24gNS8x
MC8yMiA1OjUxIEFNLCBBbWVsaWUgRGVsYXVuYXkgd3JvdGU6Cj4+IEhpIFBhdHJpY2ssCj4+IEhp
IFNlYW4sCj4+Cj4+IE9uIDUvOS8yMiAxNjozNywgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4+
IEhpIFNlYW4sCj4+Pgo+Pj4gT24gNS84LzIyIDIwOjIxLCBTZWFuIEFuZGVyc29uIHdyb3RlOgo+
Pj4+IE9uIDQvMjYvMjIgODozNyBBTSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4+Pj4gQWRk
IHRoZSBjb3VudGVyIG9mIHRoZSBQTEwgdXNlciBuX3BsbF9jb25zIG1hbmFnZWQgYnkgdGhlIDIg
ZnVuY3Rpb25zCj4+Pj4+IHN0bTMyX3VzYnBoeWNfcGxsX2VuYWJsZSAvIHN0bTMyX3VzYnBoeWNf
cGxsX2Rpc2FibGUuCj4+Pj4+Cj4+Pj4+IFRoaXMgY291bnRlciBhbGxvdyB0byByZW1vdmUgdGhl
IGZ1bmN0aW9uIHN0bTMyX3VzYnBoeWNfaXNfaW5pdAo+Pj4+PiBhbmQgaXQgaXMgYSBwcmVsaW1p
bmFyeSBzdGVwIGZvciBja191c2JvXzQ4bSBpbnRyb2R1Y3Rpb24uCj4+Pj4KPj4+PiBJcyBpdCBu
ZWNlc3NhcnkgdG8gZGlzYWJsZSB0aGlzIGNsb2NrIGJlZm9yZSBib290aW5nIHRvIExpbnV4PyBJ
ZiAKPj4+PiBpdCBpc24ndCwKPj4+PiB0aGVuIHBlcmhhcHMgaXQgaXMgc2ltcGxlciB0byBqdXN0
IG5vdCBkaXNhYmxlIHRoZSBjbG9jay4KPj4+Pgo+Pj4+IC0tU2Vhbgo+Pj4KPj4+Cj4+PiBObywg
aXQgaXMgbm90IG5lY2Vzc2FyeSwgd2Ugb25seSBuZWVkIHRvIGVuYWJsZSB0aGUgY2xvY2sgZm9y
IHRoZSAKPj4+IGZpcnN0IHVzZXIuCj4+Pgo+Pj4gSSBjb3B5IHRoZSBjbG9jayBiZWhhdmlvciBm
cm9tIGtlcm5lbCwKPj4+Cj4+PiBidXQgSSBhZ3JlZSB0aGF0IGNhbiBiZSBzaW1wbGVyLgo+Pj4K
Pj4+Cj4+PiBBbWVsaWUgYW55IG5vdGljZSBhYm91dCB0aGlzIHBvaW50ID8KPj4+Cj4+PiBEbyB5
b3UgcHJlZmVyIHRoYXQgSSBrZXB0IHRoZSBiZWhhdmlvciAtIHNhbWUgYXMga2VybmVsIGRyaXZl
ciAtIG9yIAo+Pj4gSSBzaW1wbGlmeSB0aGUgVS1Cb290IGRyaXZlciA/Cj4+Cj4+IEluIGNhc2Ug
dGhlIFBMTCBoYXMgbm90IGJlZW4gZGlzYWJsZWQgYmVmb3JlIEtlcm5lbCBib290LCB1c2JwaHlj
IAo+PiBLZXJuZWwgZHJpdmVyIHdpbGwgd2FpdCBmb3IgdGhlIFBMTCBwd2VyZG93bi4KPj4gVVNC
IGNvdWxkIGFsc28gbm90IGJlaW5nIHVzZWQgaW4gS2VybmVsLCBzbyBQTEwgd291bGQgcmVtYWlu
IGVuYWJsZWQsIAo+PiBhbmQgd291bGQgd2FzdGUgcG93ZXIuCj4+IEkgYW0gcmF0aGVyIGluIGZh
dm9yIG9mIGRpc2FibGluZyB0aGUgUExMLgo+Cj4gSXQgc2hvdWxkIGJlIGRpc2FibGVkIGlmIGNs
a19pZ25vcmVfdW51c2VkIGlzIG5vdCBpbiB0aGUga2VybmVsIAo+IHBhcmFtZXRlcnMsCj4gYXMg
bG9uZyBhcyBMaW51eCBpcyBhbHNvIGF3YXJlIG9mIHRoZSBjbG9jay4KPgo+IEdlbmVyYWxseSwg
SSB3b3VsZCBsaWtlIHRvIGF2b2lkIHJlZmNvdW50aW5nIGlmIHBvc3NpYmxlLiBNYW55IFUtQm9v
dAo+IGRyaXZlcnMgZG8gbm90IGRpc2FibGUgdGhlaXIgY2xvY2tzIChiZWNhdXNlIHRoZXkgZG9u
J3QgZG8gYW55IGNsZWFudXApLAo+IHNvIHlvdSBjYW4gZW5kIHVwIHdpdGggdGhlIGNsb2NrIHN0
YXlpbmcgb24gYW55d2F5Lgo+Cj4gLS1TZWFuCj4KPj4gUmVnYXJkcywKPj4gQW1lbGllCj4+Cj4+
Pgo+Pj4KPj4+IFBhdHJpY2sKPj4+Cj4+Pgo+Pj4+CgpJbiBnZW5lcmFsLCBJJ20gYWxzbyBpbiBm
YXZvciBvZiBub3QgZGlzYWJsaW5nIHRoZSBjbG9jayBpbiBVLUJvb3QuCgpCdXQgdGhpcyBQTEwg
d2l0aCB2ZGRhMXYxIGFuZCB2ZGRhMXY4IGRlcGVuZGVuY3kgaXMgcmVxdWVzdGVkIGZvcgoKLSBV
U0JQSFlDIGhpbXNlbGYgb3IKCi0gc291cmNlIGNsb2NrIG9mIFJDQywKCgpBbmQgd2UgaGF2ZSBo
YXZlIHNlZSBtYW55IGlzc3VlIGZvciB0aGlzIFBMTCBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZSAv
IApkZXBlbmRlbmNpZXMuCgoKU28gZm9yIGNsb2NrIHN1cHBvcnQsIEkgb25seSByZXVzZWQgdGhl
IGV4aXN0aW5nL3dvcmtpbmcgZnVuY3Rpb24gY2FsbGVkIApieSB0aGUgUEhZIG9wcyBpbml0ICYg
ZXhpdCA9CgpzdG0zMl91c2JwaHljX3BoeV9pbml0ICYgc3RtMzJfdXNicGh5Y19waHlfZXhpdAoK
PT4gdGhlIFBMTCBhbmQgdGhlIGFzc29jaWF0ZWQgVkREwqAgYXJlIGFscmVhZHkgZGVhY3RpdmF0
ZWQgb24gVVNCUEhZQyBleGl0LgoKCkFuZCB0byBiZSBjb2hlcmVudCBJIGZvciB0aGUgc2FtZSBm
b3IgdGhlIGNsb2NrIHRvIGF2b2lkIGNvbmZsaWN0IApiZXR3ZWVuIHRoZXNlIDIgdXNlcnMKCihV
U0JQSFlDIG9yIFJDQykgYXMgaXQgaXMgZG9uZSBhbHNvIGluIExpbnV4IGtlcm5lbC4KCgpBdm9p
ZCB0byBkZWFjdGl2YXRlIFBMTCBvbiBjbG9jayBkaXNhYmxlIGlzIGEgbWFqb3Igb2JqZWN0aW9u
IG9yIGp1c3QgYSAKYWR2aWNlPwoKClJlZ2FyZHMKClBhdHJpY2sKCi4KCgoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
